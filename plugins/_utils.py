import contextlib
import hashlib
import netrc
import os
import re
import stat
import tarfile
import zipfile
from urllib.parse import urlparse

import requests
from buildstream import SourceError, SourceFetcher, utils

#
# Soft import of buildstream symbols only available in newer versions
#
with contextlib.suppress(ImportError):
    from buildstream import SourceInfoMedium, SourceVersionType


def add_alias(manifest, original_url):
    if not manifest["url"].startswith(original_url):
        alias, _, _ = original_url.partition(":")
        manifest["alias"] = alias


def get_netrc_credentials(url):
    p = urlparse(url)
    if p.scheme != "https":
        return {}
    try:
        n = netrc.netrc()
        creds = n.authenticators(p.hostname)

        if creds is not None:
            # creds is a tuple (username, account, password)
            return {"username": creds[0], "password": creds[2]}
    except FileNotFoundError:
        pass

    return {}


def translate_url(
    source, url, suffix, alias_override=None, primary=True, extra_data=None
):
    if utils.get_bst_version() >= (2, 2):
        url = source.translate_url(
            url,
            suffix=suffix,
            alias_override=alias_override,
            primary=primary,
            extra_data=extra_data,
        )
    else:
        base_url = source.translate_url(
            url, alias_override=alias_override, primary=primary
        )
        url = base_url + suffix
    return url


class BearerAuth(requests.auth.AuthBase):
    def __call__(self, r):
        creds = get_netrc_credentials(r.url)
        if "password" in creds:
            r.headers["Authorization"] = "Bearer {password}".format(**creds)
        return r


class HTTPFetcher(SourceFetcher):
    def __init__(
        self,
        source,
        mirror_directory,
        url,
        suffix=None,
        sha256sum=None,
        guesser=None,
        ecosystem=None,
    ):
        super().__init__()
        self.source = source
        self.mirror_directory = mirror_directory
        self.url = url
        self.suffix = suffix
        self.sha256sum = sha256sum
        self.guesser = guesser
        self.ecosystem = ecosystem

        self.mark_download_url(url)

    @property
    def mirror_file(self):
        assert self.sha256sum is not None, "sha256sum not known yet"
        return os.path.join(self.mirror_directory, self.sha256sum)

    def is_cached(self):
        return os.path.isfile(self.mirror_file)

    def is_resolved(self):
        return self.sha256sum is not None

    def fetch(self, alias_override=None):
        extra_data = {}
        url = translate_url(
            self.source,
            self.url,
            self.suffix,
            alias_override,
            extra_data=extra_data,
        )

        auth_scheme = extra_data.get("http-auth")
        # Defaults to basic auth
        auth = BearerAuth() if auth_scheme == "bearer" else None

        with contextlib.ExitStack() as stack:
            stack.enter_context(
                self.source.timed_activity(f"Fetching from {url}")
            )
            try:
                tempdir = stack.enter_context(self.source.tempdir())

                headers = {"Accept": "*/*", "User-Agent": "BuildStream/2"}
                resp = stack.enter_context(
                    requests.get(
                        url,
                        headers=headers,
                        stream=True,
                        timeout=60,
                        auth=auth,
                    )
                )

                if not resp.ok:
                    raise SourceError(
                        f"Error mirroring {url}: HTTP Error {resp.status_code}: {resp.reason}"
                    )

                local_file = os.path.join(tempdir, os.path.basename(url))

                h = hashlib.sha256()
                with open(local_file, "wb") as dest:
                    for chunk in resp.iter_content(None):
                        dest.write(chunk)
                        h.update(chunk)

                computed = h.hexdigest()
                if self.sha256sum is None:
                    self.sha256sum = computed
                elif self.sha256sum != computed:
                    raise SourceError(
                        f"{url} expected hash {self.sha256sum}, got {computed}"
                    )

                os.makedirs(self.mirror_directory, exist_ok=True)
                os.rename(local_file, self.mirror_file)

            except requests.ConnectionError as e:
                raise SourceError(
                    f"Error mirroring {url}: {e}", temporary=True
                ) from e
            except OSError as e:
                raise SourceError(
                    f"Error mirroring {url}: {e}", temporary=True
                ) from e

            return self.sha256sum

    def get_source_info(self):
        url = translate_url(self.source, self.url, self.suffix)

        version_guess = None
        if self.guesser:
            version_guess = self.guesser.guess_version(url)

        return self.source.create_source_info(
            url,
            SourceInfoMedium.REMOTE_FILE,
            SourceVersionType.SHA256,
            self.sha256sum,
            version_guess=version_guess,
            extra_data={"ecosystem": self.ecosystem},
        )


def _strip_top_dir(members, attr, is_dir_attr):
    for member in members:
        path = getattr(member, attr)
        trail_slash = path.endswith("/")
        path = path.rstrip("/")
        splitted = getattr(member, attr).split("/", 1)
        new_path = path
        if len(splitted) == 2:
            new_path = splitted[1]
            if trail_slash:
                new_path += "/"

        if getattr(member, is_dir_attr)() and len(splitted) == 1:
            # do not yield the root directory
            continue
        setattr(member, attr, new_path)
        yield member


class TarStager:
    def __init__(self, mirror_file, exclude=None):
        self.mirror_file = mirror_file
        self.exclude = exclude or []

    def stage(self, directory):
        with tarfile.open(self.mirror_file, "r:*") as tar:
            members = (
                member
                for member in _strip_top_dir(tar.getmembers(), "path", "isdir")
                if not any(
                    any(utils.glob([member.name], pattern))
                    for pattern in self.exclude
                )
            )
            tar.extractall(path=directory, members=members)


class ZipStager:
    def __init__(self, mirror_file):
        self.mirror_file = mirror_file

    def stage(self, directory):
        exec_rights = (stat.S_IRWXU | stat.S_IRWXG | stat.S_IRWXO) & ~(
            stat.S_IWGRP | stat.S_IWOTH
        )
        noexec_rights = exec_rights & ~(
            stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH
        )

        with zipfile.ZipFile(self.mirror_file, mode="r") as zipf:
            # Taken from zip plugin. It is needed to ensure reproducibility of permissions
            for member in _strip_top_dir(
                zipf.infolist(), "filename", "is_dir"
            ):
                written = zipf.extract(member, path=directory)
                rel = os.path.relpath(written, start=directory)
                assert not os.path.isabs(rel)
                rel = os.path.dirname(rel)
                while rel:
                    os.chmod(os.path.join(directory, rel), exec_rights)
                    rel = os.path.dirname(rel)

                if os.path.islink(written):
                    pass
                elif os.path.isdir(written):
                    os.chmod(written, exec_rights)
                else:
                    os.chmod(written, noexec_rights)


# Common code for implementing version guessing on source plugins.
#
# To use this:
#
#   * Add `version-guess-pattern` and `version` to the validated keys
#     in Plugin.configure()
#
#   * Document `version-guess-pattern` and `version` in your plugin's
#     module level docstring
#
#   * Call VersionGuesser.configure() In your Plugin.configure()
#
#   * Call VersionGuesser.augment_unique_key() in your Plugin.get_unique_key()
#
#   * Call VersionGuesser.guess_version() in your Source.collect_source_info()
#     or SourceFetcher.get_source_info() implementation
#
#     Alternatively, if you are using the HTTPFetcher above, you can just pass
#     along the guesser to its constructor and it will take care of implementing
#     SourceFetcher.get_source_info()
#
class VersionGuesser:
    def __init__(self):
        # Set defaults
        self.guess_pattern_string = None
        self.guess_pattern = None
        self.version = None

    #
    # Use this in your Plugin.configure() implementation
    #
    def configure(self, node):
        self.guess_pattern_string = node.get_str("version-guess-pattern", None)
        if self.guess_pattern_string is not None:
            self.guess_pattern = re.compile(self.guess_pattern_string)

        self.version = node.get_str("version", None)

    #
    # Use this in your Plugin.get_unique_key() implementation
    #
    # Supports list and dict formats of unique keys
    #
    def augment_unique_key(self, unique_key):
        if isinstance(unique_key, list):
            if self.version is not None:
                unique_key.append(self.version)
            elif self.guess_pattern_string is not None:
                unique_key.append(self.guess_pattern_string)
        elif isinstance(unique_key, dict):
            if self.version is not None:
                unique_key["version"] = self.version
            elif self.guess_pattern_string is not None:
                unique_key["version-guess-pattern"] = self.guess_pattern_string
        else:
            assert False, "Unexpected unique key format"

        return unique_key

    #
    # Use this in your Source.collect_source_info() or
    # SourceFetcher.get_source_info() implementation
    #
    # The string parameter is a string in which we suspect to find a version,
    # which is likely to be a URL or a filename.
    #
    def guess_version(self, string):
        if self.version is not None:
            return self.version

        if string is None:
            return None

        # We only optionally support BuildStream 2.5.x. In practice, this
        # codepath will not be reached unless we are running BuildStream 2.5.x.
        #

        return utils.guess_version(string, pattern=self.guess_pattern)

