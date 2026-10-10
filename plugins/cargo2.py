#
#  Copyright (C) 2024 GNOME Foundation Inc.
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library. If not, see <http://www.gnu.org/licenses/>.
#
#  Authors:
#        Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
#        Sophie Herold <sophieherold@gnome.org>

#
# This plugin was originally developped in the https://gitlab.com/BuildStream/bst-plugins-experimental/
# repository and was copied from a60426126e5bec2d630fcd889a9f5af13af00ea6
#
# After that the plugin was developed in buildstream-plugins:
# <https://github.com/apache/buildstream-plugins/blob/db71610b7ae9884f6d8cbe0d3cc5a1c657c19edb/src/buildstream_plugins/sources/cargo.py>
#
# It was moved to experimental (now called 'community') as a new version
# again because of added external dependencies like dulwich.

"""
cargo2 - Automatically stage crate dependencies
===============================================
A convenience Source element for vendoring rust project dependencies.

Placing this source in the source list, after a source which stages a
Cargo.lock file, will allow this source to read the Cargo.lock file and
obtain the crates automatically into %{vendordir}.

**Usage:**

.. code:: yaml

   # Specify the cargo2 source kind
   kind: cargo2

   # Url of the crates repository to download from (default: https://static.crates.io/crates)
   url: https://static.crates.io/crates

   # Url mappings to download git sources from. The values support aliases to which global
   # mirrors are also applied. More specific mappings take precedence over more general ones.
   git-mirrors:
    https://gitlab.com: "github:"
    https://gitlab.com/specific/repo: https://example.org/specific/repo

   # Internal source reference, this is a list of dictionaries
   # which store the crate names and versions.
   #
   # This will be automatically updated with `bst track`
   ref:
   - name: packagename
     version: 1.2.1
   - name: packagename
     version: 1.3.0

   # Specify a directory for the vendored crates (defaults to ./.vendored-crates)
   vendor-dir: .vendored-crates

   # Optionally specify the name of the lock file to use (defaults to Cargo.lock)
   cargo-lock: Cargo.lock

See `built-in functionality doumentation
<https://docs.buildstream.build/master/buildstream.source.html#core-source-builtins>`_ for
details on common configuration options for sources.


Reporting `SourceInfo <https://docs.buildstream.build/master/buildstream.source.html#buildstream.source.SourceInfo>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The cargo2 source reports different SourceInfo depending on the dependency types.

For any crate dependency type, the versions extracted from the Cargo.lock at tracking
time are used to report the *guess_version*.


Regular dependencies
''''''''''''''''''''
For crates downloaded from the registry, the URL of the crate is reported as the *url*.

Further, the cargo2 source in this case reports the `SourceInfoMedium.REMOTE_FILE
<https://docs.buildstream.build/master/buildstream.source.html#buildstream.source.SourceInfoMedium.REMOTE_FILE>`_
*medium* and the `SourceVersionType.SHA256
<https://docs.buildstream.build/master/buildstream.source.html#buildstream.source.SourceVersionType.SHA256>`_
*version_type*, for which it reports the sha256 checksum of the remote file content as the *version*.

Additionally, the cargo2 source in this case reports the crates.io ecosystem through
the ``ecosystem`` key of the *extra_data*, using the same identifiers as the `OSV
ecosystems list <https://storage.googleapis.com/osv-vulnerabilities/ecosystems.txt>`_.


Dependencies via git
''''''''''''''''''''
For crates downloaded from git, the URL of the git repository is reported as the *url*.

Further, the cargo2 source in this case reports the `SourceInfoMedium.GIT
<https://docs.buildstream.build/master/buildstream.source.html#buildstream.source.SourceInfoMedium.GIT>`_
*medium* and the `SourceVersionType.COMMIT
<https://docs.buildstream.build/master/buildstream.source.html#buildstream.source.SourceVersionType.COMMIT>`_
*version_type*, for which it reports the git sha in the git repository as the *version*.

Additionally, the cargo2 source in this case reports the name of the crate to be
obtained from the git repository through the ``crate-name`` key of the *extra_data*.

It also reports the GIT ecosystem through the ``ecosystem`` key of the *extra_data*,
using the same identifiers as the `OSV ecosystems list
<https://storage.googleapis.com/osv-vulnerabilities/ecosystems.txt>`_.
"""

import contextlib
import glob
import json
import netrc
import os
import os.path
import shutil
import tarfile
import threading
import urllib.error
import urllib.parse
import urllib.request
from urllib.parse import parse_qsl, urlencode, urlparse

# We prefer tomli that was put into standard library as tomllib
# starting from 3.11
try:
    import tomllib  # type: ignore
except ImportError:
    import tomli as tomllib  # type: ignore

from buildstream import Source, SourceError, SourceFetcher, utils

#
# Soft import of buildstream symbols only available in newer versions
#
with contextlib.suppress(ImportError):
    from buildstream import SourceInfoMedium, SourceVersionType

import tomlkit
from dulwich.repo import Repo

from ._git_utils import (
    CONNECTION_ERRORS,
    get_authenticated_transport_and_path,
    verify_version,
)
from ._utils import add_alias


# CrateRegistry()
#
# Use a SourceFetcher class to be the per crate helper.
#
# This one is for crates fetched from registries like crates.io.
#
# Args:
#    cargo (Cargo): The main Source implementation
#    name (str): The name of the crate to depend on
#    version (str): The version of the crate to depend on
#    sha (str|None): The sha256 checksum of the downloaded crate
#
class CrateRegistry(SourceFetcher):
    def __init__(self, cargo, name, version, sha=None, provenance=None):
        super().__init__()

        self.cargo = cargo
        self.name = name
        self.version = str(version)
        self.sha = sha
        self.mark_download_url(cargo.url)
        self.provenance = provenance

    ########################################################
    #     SourceFetcher API method implementations         #
    ########################################################

    def fetch(self, alias_override=None, **kwargs):
        # Just a defensive check, it is impossible for the
        # file to be already cached because Source.fetch() will
        # not be called if the source is already cached.
        #
        if os.path.isfile(self._get_mirror_file()):
            return  # pragma: nocover

        # Download the crate
        crate_url, auth_scheme = self._get_url(alias_override)
        with self.cargo.timed_activity(
            f"Downloading: {crate_url}", silent_nested=True
        ):
            sha256 = self._download(crate_url, auth_scheme)
            if self.sha is not None and sha256 != self.sha:
                raise SourceError(
                    f"File downloaded from {crate_url} has sha256sum '{sha256}', not '{self.sha}'!"
                )

    def get_source_info(self):
        url, _ = self._get_url()
        if utils.get_bst_version() < (2, 7):
            # provenance_node isn't supported for buildstream versions below 2.7
            return self.cargo.create_source_info(
                url,
                SourceInfoMedium.REMOTE_FILE,
                SourceVersionType.SHA256,
                self.sha,
                version_guess=self.version,
                extra_data={"ecosystem": "crates.io"},
            )
        return self.cargo.create_source_info(
            url,
            SourceInfoMedium.REMOTE_FILE,
            SourceVersionType.SHA256,
            self.sha,
            version_guess=self.version,
            provenance_node=self.provenance,
            extra_data={"ecosystem": "crates.io"},
        )

    ########################################################
    #        Helper APIs for the Cargo Source to use       #
    ########################################################

    def ref_node(self):
        return {
            "kind": "registry",
            "name": self.name,
            "version": self.version,
            "sha": self.sha,
        }

    # stage()
    #
    # A delegate method to do the work for a single crate
    # in Source.stage().
    #
    # Args:
    #    (directory): The vendor subdirectory to stage to
    #
    def stage(self, directory):
        try:
            mirror_file = self._get_mirror_file()

            if os.path.exists(
                os.path.join(directory, f"{self.name}-{self.version}")
            ):
                raise SourceError(
                    f"This project requests crate {self.name} {self.version} from multiple sources, "
                    "which is incompatible with vendoring since cargo does not support it."
                )

            with tarfile.open(mirror_file) as tar:
                tar.extractall(path=directory)
                members = tar.getmembers()

            if members:
                dirname = members[0].name.split("/")[0]
                package_dir = os.path.join(directory, dirname)
                checksum_file = os.path.join(
                    package_dir, ".cargo-checksum.json"
                )
                with open(checksum_file, "w", encoding="utf-8") as f:
                    checksum_data = {"package": self.sha, "files": {}}
                    json.dump(checksum_data, f)

        except (tarfile.TarError, OSError) as e:
            raise SourceError(f"{self}: Error staging source: {e}") from e

    # is_cached()
    #
    # Get whether we have a local cached version of the source
    #
    # Returns:
    #   (bool): Whether we are cached or not
    #
    def is_cached(self):
        return os.path.isfile(self._get_mirror_file())

    # is_resolved()
    #
    # Get whether the current crate is resolved
    #
    # Returns:
    #   (bool): Whether we have a sha or not
    #
    def is_resolved(self):
        return self.sha is not None

    ########################################################
    #                   Private helpers                    #
    ########################################################

    # _download()
    #
    # Downloads the crate from the url and caches it.
    #
    # Args:
    #    url (str): The url to download from
    #
    # Returns:
    #    (str): The sha256 checksum of the downloaded crate
    #
    def _download(self, url, auth_scheme):
        # We do not use etag in case what we have in cache is
        # not matching ref in order to be able to recover from
        # corrupted download.
        etag = self._get_etag(self.sha) if self.sha else None

        with self.cargo.tempdir() as td:
            local_file, etag, error = download_file(url, etag, td, auth_scheme)

            if error:
                raise SourceError(
                    f"{self}: Error mirroring {url}: {error}",
                    temporary=True,
                )

            # Make sure url-specific mirror dir exists.
            os.makedirs(self._get_mirror_dir(), exist_ok=True)

            # Store by sha256sum
            sha256 = utils.sha256sum(local_file)
            # Even if the file already exists, move the new file over.
            # In case the old file was corrupted somehow.
            os.rename(local_file, self._get_mirror_file(sha256))

            if etag:
                self._store_etag(sha256, etag)
            return sha256

    # _get_url()
    #
    # Fetches the URL to download this crate from
    #
    # Args:
    #    alias (str|None): The URL alias to apply, if any
    #
    # Returns:
    #    (str): The URL for this crate
    #
    def _get_url(self, alias=None):
        path = f"{self.name}/{self.name}-{self.version}.crate"
        extra_data = {}
        if utils.get_bst_version() >= (2, 2):
            translated_url = self.cargo.translate_url(
                self.cargo.url,
                suffix=path,
                alias_override=alias,
                extra_data=extra_data,
            )
        else:
            translated_url = (
                self.cargo.translate_url(self.cargo.url, alias_override=alias)
                + path
            )

        return translated_url, extra_data.get("http-auth")

    # _get_etag()
    #
    # Fetches the locally stored ETag information for this
    # crate's download.
    #
    # Args:
    #    sha (str): The sha256 checksum of the downloaded crate
    #
    # Returns:
    #    (str|None): The ETag to use for requests, or None if nothing is
    #                locally downloaded
    #
    def _get_etag(self, sha):
        etagfilename = os.path.join(self._get_mirror_dir(), f"{sha}.etag")
        if os.path.exists(etagfilename):
            with open(etagfilename, "r", encoding="utf-8") as etagfile:
                return etagfile.read()

        return None

    # _store_etag()
    #
    # Stores the locally cached ETag information for this crate.
    #
    # Args:
    #    sha (str): The sha256 checksum of the downloaded crate
    #    etag (str): The ETag to use for requests of this crate
    #
    def _store_etag(self, sha, etag):
        etagfilename = os.path.join(self._get_mirror_dir(), f"{sha}.etag")
        with utils.save_file_atomic(etagfilename) as etagfile:
            etagfile.write(etag)

    # _get_mirror_dir()
    #
    # Gets the local mirror directory for this upstream cargo repository
    #
    def _get_mirror_dir(self):
        return os.path.join(
            self.cargo.get_mirror_directory(),
            utils.url_directory_name(self.cargo.url),
            self.name,
            self.version,
        )

    # _get_mirror_file()
    #
    # Gets the local mirror filename for this crate
    #
    # Args:
    #    sha (str|None): The sha256 checksum of the downloaded crate
    #
    def _get_mirror_file(self, sha=None):
        return os.path.join(self._get_mirror_dir(), sha or self.sha)

    def export_manifest(self):
        url, _ = self._get_url()
        manifest = {
            "type": "archive",
            "url": url,
            "sha256": self.sha,
        }
        add_alias(manifest, self.cargo.url)
        return manifest


# Locks on repositories for write access
REPO_LOCKS = {}  # type: dict[str, threading.Lock]


# CrateGit()
#
# Use a SourceFetcher class to be the per crate helper.
#
# This one is for crates fetched from git repositories.
#
# Args:
#    cargo (Cargo): The main Source implementation
#    name (str): The name of the crate to depend on
#    version (str): The version of the crate to depend on
#    repo (str): Repository URL
#    commit (str): Sha of the git commit
class CrateGit(SourceFetcher):
    def __init__(
        self, cargo, name, version, repo, commit, query, provenance=None
    ):
        super().__init__()

        self.cargo = cargo
        self.name = name
        self.version = str(version)
        self.repo = repo
        self.commit = commit
        self.query = query
        self.provenance = provenance
        self.repo_mirrored = cargo.mirrored_git_url(repo)

        self.mark_download_url(self.repo_mirrored)

    ########################################################
    #     SourceFetcher API method implementations         #
    ########################################################

    def fetch(self, alias_override=None, **kwargs):
        lock = REPO_LOCKS.setdefault(self._get_mirror_dir(), threading.Lock())
        repo_url = self._get_url(alias=alias_override)

        with (
            lock,
            self._mirror_repo() as repo,
            self.cargo.timed_activity(f"Fetching from {repo_url}"),
        ):
            client, path = get_authenticated_transport_and_path(repo_url)
            try:
                client.fetch(
                    path,
                    repo,
                    determine_wants=lambda refs, depth=None: [
                        self.commit.encode()
                    ],
                    depth=1,
                )
            except CONNECTION_ERRORS as e:
                raise SourceError(f"failed to fetch: {e}") from e

    # get_source_info()
    #
    # Gets the SourceInfo object for this crate
    #
    # Returns: The SourceInfo object
    #
    def get_source_info(self):
        url = self._get_url()
        if utils.get_bst_version() < (2, 7):
            # provenance_node isn't supported for buildstream versions below 2.7
            return self.cargo.create_source_info(
                url,
                SourceInfoMedium.GIT,
                SourceVersionType.COMMIT,
                self.commit,
                version_guess=self.version,
                extra_data={"crate-name": self.name, "ecosystem": "GIT"},
            )
        return self.cargo.create_source_info(
            url,
            SourceInfoMedium.GIT,
            SourceVersionType.COMMIT,
            self.commit,
            version_guess=self.version,
            provenance_node=self.provenance,
            extra_data={"crate-name": self.name, "ecosystem": "GIT"},
        )

    ########################################################
    #        Helper APIs for the Cargo Source to use       #
    ########################################################

    def ref_node(self):
        node = {
            "kind": "git",
            "name": self.name,
            "version": self.version,
            "repo": self.repo,
            "commit": self.commit,
        }

        if self.query:
            node["query"] = self.query

        return node

    # stage()
    #
    # A delegate method to do the work for a single git repo
    # in Source.stage().
    #
    # Args:
    #    (directory): The vendor subdirectory to stage to
    #
    def stage(self, directory):
        self.cargo.status(f"Checking out {self.commit}")

        crate_target_dir = os.path.join(
            directory, f"{self.name}-{self.version}"
        )
        tmp_dir = os.path.join(directory, f"{self.name}-{self.version}-tmp")

        try:
            os.makedirs(tmp_dir)
        except FileExistsError as e:
            raise SourceError(
                f"This project requests crate {self.name} {self.version} from multiple sources, "
                "which is incompatible with vendoring since cargo does not support it."
            ) from e

        with Repo(self._get_mirror_dir(), bare=True) as mirror:
            with Repo.init(tmp_dir) as dest:
                dest.object_store.add_object(mirror[self.commit.encode()])
                dest.refs[b"HEAD"] = self.commit.encode()
                dest.update_shallow([self.commit.encode()], [])

            with Repo(tmp_dir, object_store=mirror.object_store) as dest:
                dest.get_worktree().reset_index()

        # Workspace handling
        #
        # When new workspace features are added it is worth checking if
        # <https://github.com/flatpak/flatpak-builder-tools/blob/HEAD/cargo/flatpak-cargo-generator.py>
        # has implemented them already. This implementation is inspired by the mentioned source.

        with open(os.path.join(tmp_dir, "Cargo.toml"), "rb") as f:
            root_toml = tomllib.load(f)

        crates = {}

        # Determine if the package exists directly in manifest.
        # If a workspace exists, this is called a root package.
        # <https://doc.rust-lang.org/cargo/reference/workspaces.html#root-package>
        has_root_package = (
            root_toml.get("package", {}).get("name") == self.name
        )

        # Try workspaces first since even if the package is defined in the manifest,
        # it will be part of a workspace if workspaces are used. In this case,
        # inheritance also needs to be applied to the root manifest.
        if "workspace" in root_toml:
            # Crates specified under workspace.dependencies with the "path" key are
            # implicitly part of workspace.members
            #
            # This function adds these implict workspace mebeers them to the `crates` variable
            def add_implict_workspace_memebers(path, toml):
                for dep_details in toml.get("dependencies", {}).values():
                    dep_path = (
                        dep_details.get("path")
                        if isinstance(dep_details, dict)
                        else None
                    )

                    if not dep_path:
                        continue

                    sub_crate_path = os.path.join(path, dep_path)
                    sub_crate_toml_path = os.path.join(
                        sub_crate_path, "Cargo.toml"
                    )

                    if not os.path.isfile(sub_crate_toml_path):
                        continue

                    with open(sub_crate_toml_path, "rb") as f:
                        sub_crate_toml = tomllib.load(f)

                    # Resolve the dependency definitions inherited from workspace
                    config_inherit_workspace(
                        sub_crate_toml, root_toml["workspace"]
                    )

                    if "package" in sub_crate_toml:
                        sub_crate_name = sub_crate_toml["package"]["name"]
                        if sub_crate_name not in crates:
                            crates[sub_crate_name] = {
                                "config": sub_crate_toml,
                                "path": sub_crate_path,
                            }

                            add_implict_workspace_memebers(
                                sub_crate_path, sub_crate_toml
                            )

            workspace = root_toml["workspace"]
            workspace_members = workspace.get("members", [])

            if has_root_package:
                # The root package is always part of the workspace. If it was added
                # explicitly and we now hit it twice, that's no problem.
                workspace_members.append(".")

            # Load all package information in workspace to find current crate
            for member in workspace_members:
                for crate_toml_path in glob.glob(
                    os.path.join(tmp_dir, member, "Cargo.toml")
                ):
                    crate_path = os.path.normpath(
                        os.path.dirname(crate_toml_path)
                    )

                    with open(crate_toml_path, "rb") as f:
                        crate_toml = tomllib.load(f)
                        crates[crate_toml["package"]["name"]] = {
                            "config": crate_toml,
                            "path": crate_path,
                        }

                        add_implict_workspace_memebers(crate_path, crate_toml)

            crate = crates.get(self.name)
            if crate is None:
                raise SourceError(
                    f"Crate '{self.name}' neither found in root nor workspace manifests. Root manifest:\n{root_toml}\nMember manifests:{crates}"
                )

            # Apply information inherited from workspace Cargo.toml
            config_inherit_workspace(crate["config"], root_toml["workspace"])

            with open(
                os.path.join(crate["path"], "Cargo.toml"),
                "w",
                encoding="utf-8",
            ) as f:
                tomlkit.dump(crate["config"], f)

            shutil.move(crate["path"], crate_target_dir)
        elif has_root_package:
            # No workspaces involved, just deploy complete dir as is
            shutil.move(tmp_dir, crate_target_dir)
        else:
            raise SourceError(
                f"Crate '{self.name}' not found in root manifest. No workspaces found. Root manifest:\n{root_toml}"
            )

        # Write .cargo-checksum.json required by cargo vendoring
        with open(
            os.path.join(crate_target_dir, ".cargo-checksum.json"),
            "w",
            encoding="utf-8",
        ) as f:
            json.dump({"files": {}, "package": None}, f)

        shutil.rmtree(tmp_dir, ignore_errors=True)

    # is_cached()
    #
    # Get whether we have a local cached version of the git commit
    #
    # Returns:
    #   (bool): Whether we are cached or not
    #
    def is_cached(self):
        with Repo(self._get_mirror_dir(), bare=True) as repo:
            return self.commit.encode() in repo

    # is_resolved()
    #
    # Get whether the current git repo is resolved
    #
    # Returns:
    #   (bool): Always true since we always have a commit
    #
    def is_resolved(self):
        return True

    ########################################################
    #                   Private helpers                    #
    ########################################################

    # _get_mirror_dir()
    #
    # Gets the local mirror directory for this upstream git repository
    #
    def _get_mirror_dir(self):
        norm_url = self.repo.removesuffix(".git")

        return os.path.join(
            self.cargo.get_mirror_directory(),
            utils.url_directory_name(norm_url) + ".git",
        )

    # _get_url()
    #
    # Gets the git URL to download this crate from
    #
    # Args:
    #    alias (str|None): The URL alias to apply, if any
    #
    # Returns:
    #    (str): The URL for this crate
    #
    def _get_url(self, alias=None):
        return self.cargo.translate_url(
            self.repo_mirrored, alias_override=alias, primary=False
        )

    # _mirror_repo()
    #
    # Returns the mirror repo, initialized if it doesn not exist yet
    #
    # Returns:
    #    (Repo): The mirror repo crate
    #
    def _mirror_repo(self):
        try:
            return Repo.init_bare(self._get_mirror_dir(), mkdir=True)
        except FileExistsError:
            return Repo(self._get_mirror_dir(), bare=True)

    def export_manifest(self):
        url = self._get_url()
        manifest = {
            "type": "git",
            "url": url,
            "commit": self.commit,
        }
        add_alias(manifest, self.repo_mirrored)
        return manifest


# config_inherit_workspace()
#
# Cargo workspaces can define different values that can be inherited by member crates.
# The values that can be inherited are currently package information like the license
# (see `inherit_package()`) and settings for dependencies like the required version
# (see `inherit_deps`).
#
# Args:
#    config (dict): Crate config
#    workspace_config (dict): Workspace config
def config_inherit_workspace(config, workspace_config):
    workspace_deps = workspace_config.get("dependencies")
    if workspace_deps is not None:
        dependencies = []

        # Find all dependency lists that can inherit from the workspace
        # <https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html#inheriting-a-dependency-from-a-workspace>
        for key in ["dependencies", "dev-dependencies", "build-dependencies"]:
            if key in config:
                dependencies.append(config[key])
        if "target" in config:
            for target in config["target"].values():
                if "dependencies" in target:
                    dependencies.append(target["dependencies"])

        for deps in dependencies:
            inherit_deps(deps, workspace_deps)

    inherit_package(config, workspace_config)
    inherit_lints(config, workspace_config)


# inherit_package()
#
# Modifies the values in `items` that are configured to inherit from the workspace.
# The new values are taken from `workspace_items`.
# <https://doc.rust-lang.org/cargo/reference/workspaces.html#the-package-table>
#
# Args:
#    config (dict): The crate config
#    workspace_config (dict): The workspace config
def inherit_package(config, workspace_config):
    workspace_items = workspace_config.get("package")
    items = config.get("package")

    for key, value in items.items():
        if isinstance(value, dict) and "workspace" in value:
            workspace_value = workspace_items.get(key)
            if workspace_value is None:
                raise SourceError(
                    f"Failed to inherit 'package.{key}' in crate's Cargo.toml. "
                    "Value missing from workspace's Cargo.toml."
                )

            items[key] = workspace_value


# inherit_lints()
#
# Inherits lints from the workspace. Lints are either completely overwritten by
# workspace values or defined by the crate itself.
# <https://doc.rust-lang.org/cargo/reference/workspaces.html#the-lints-table>
#
# Args:
#    config (dict): The crate config
#    workspace_config (dict): The workspace config
def inherit_lints(config, workspace_config):
    if config.get("lints", {}).get("workspace") and workspace_config.get(
        "lints"
    ):
        config["lints"] = workspace_config.get("lints")


# inherit_deps()
#
# Modifies the values in `deps` if they are set to inherit information from the workspace.
# The new values are taken from `workspace_deps`.
# <https://doc.rust-lang.org/cargo/reference/workspaces.html#the-dependencies-table>
#
# Args:
#    deps (dict): A dependencies section like from [dev-dependencies]
#    workspace_deps (dict): Workspace dependency table
def inherit_deps(deps, workspace_deps):
    for crate, details in deps.items():
        if isinstance(details, dict) and "workspace" in details:
            workspace_details = workspace_deps.get(crate)
            if workspace_details is None:
                raise SourceError(
                    "Failed to inherit dependency information for '{crate}' in crate's Cargo.toml. "
                    "Value missing from workspace's Cargo.toml."
                )

            # Workspace definition is a dict
            if isinstance(workspace_details, dict):
                del details["workspace"]

                # Combine the features from workspsace and crate level
                # Duplication is not needed since `cargo vendor` also adds duplicates
                features = workspace_details.get("features", []) + details.get(
                    "features", []
                )

                details.update(workspace_details)

                # Write combined features
                if features:
                    details["features"] = features

            # Workspace definition is just a version
            else:
                del details["workspace"]
                details.update({"version": workspace_details})


class CargoSource(Source):
    BST_MIN_VERSION = "2.0"
    BST_EXPORT_MANIFEST = True

    # We need the Cargo.lock file to construct our ref at track time
    BST_REQUIRES_PREVIOUS_SOURCES_TRACK = True

    ########################################################
    #       Plugin/Source API method implementations       #
    ########################################################
    def configure(self, node):
        # The url before any aliasing
        #
        self.original_url = node.get_str(
            "url", "https://static.crates.io/crates"
        )
        self.cargo_lock = node.get_str("cargo-lock", "Cargo.lock")
        self.vendor_dir = node.get_str("vendor-dir", ".vendored-crates")
        self.git_mirrors = node.get_mapping("git-mirrors", {})
        self.provenance = {}

        # Because source provenance info lives in the ref it would be
        # removed upon source track, create a backup here so it is
        # available to be added back in when setting the ref
        ref = node.get_sequence("ref", None)
        if ref is not None:
            for crate in ref:
                if "provenance" in crate:
                    crate_name = crate.get_str("name")
                    provenance = crate.get_mapping("provenance")
                    self.provenance[crate_name] = provenance.strip_node_info()

        # If the specified URL is just an alias, require the alias to resolve
        # to a URL with a trailing slash. Otherwise, append a trailing slash if
        # it's missing, for backward compatibility.
        self.url = self.original_url
        if not self.url.endswith(":") and not self.url.endswith("/"):
            self.url += "/"

        node.validate_keys(
            Source.COMMON_CONFIG_KEYS
            + ["url", "ref", "cargo-lock", "vendor-dir", "git-mirrors"]
        )

        # Needs to be marked here so that `track` can translate it later.
        self.mark_download_url(self.url)

        # Needs to be marked here such that it can be used in fetch later.
        for crate in node.get_sequence("ref", []):
            if crate.get_str("kind", "") == "git":
                self.mark_download_url(crate.get_str("repo"), primary=False)

        self.load_ref(node)

    def preflight(self):
        verify_version()

    def get_unique_key(self):
        return [
            self.original_url,
            self.cargo_lock,
            self.vendor_dir,
            self.ref,
            # Use next letter if cache invalidation is needed.
            # This can be necessary if plugin behavior for the same key has changed.
            "a",
        ]

    def is_resolved(self):
        return (self.ref is not None) and all(
            crate.is_resolved() for crate in self.crates
        )

    def is_cached(self):
        return all(crate.is_cached() for crate in self.crates)

    def load_ref(self, node):
        ref = node.get_sequence("ref", None)
        self._recompute_crates(ref)

    def get_ref(self):
        return self.ref

    def set_ref(self, ref, node):
        # add provenance back in
        if ref is not None:
            for crate in ref:
                if crate["name"] in self.provenance:
                    crate["provenance"] = self.provenance[crate["name"]]

            node["ref"] = ref
            self._recompute_crates(node.get_sequence("ref"))

    def track(self, *, previous_sources_dir):
        new_ref = []
        lockfile = os.path.join(previous_sources_dir, self.cargo_lock)

        try:
            with open(lockfile, "rb") as f:
                try:
                    lock = tomllib.load(f)
                except tomllib.TOMLDecodeError as e:
                    raise SourceError(
                        f"Malformed Cargo.lock file at: {self.cargo_lock}",
                        detail=f"{e}",
                    ) from e
        except FileNotFoundError as e:
            raise SourceError(
                f"Failed to find Cargo.lock file at: {self.cargo_lock}",
                detail="The cargo plugin expects to find a Cargo.lock file in\n"
                + "the sources staged before it in the source list, but none was found.",
            ) from e

        # FIXME: Better validation would be good here, so we can raise more
        #        useful error messages in the case of a malformed Cargo.lock file.
        #
        for package in lock["package"]:
            if "source" not in package:
                continue

            ref = {}

            (kind, url) = package["source"].split("+", 2)
            ref["kind"] = kind

            if kind not in ["git", "registry"]:
                raise SourceError(
                    f"Unkown source kind '{kind}' for crate {package['name']}"
                )

            if kind == "git":
                url_parsed = urlparse(url)
                ref["commit"] = url_parsed.fragment

                # Remove extra information since it confused URL translation
                repo_url = url_parsed._replace(fragment="", query="").geturl()

                # If there is an applicable mirroring alias, use it
                ref["repo"] = self.mirrored_git_url(repo_url)

                # Store the query information since cargo checks it with the commit
                # The query contains branch, tag, or rev
                query_list = parse_qsl(url_parsed.query)
                if query_list:
                    ref["query"] = dict(query_list)

            ref.update(
                {"name": package["name"], "version": str(package["version"])}
            )

            if kind == "registry":
                ref["sha"] = package.get("checksum")

            new_ref.append(ref)

        # Make sure the order we set it at track time is deterministic
        new_ref = sorted(
            new_ref,
            key=lambda c: (
                c["name"],
                c["version"],
                c.get("repo", ""),
                c.get("commit", ""),
            ),
        )

        # Download the crates and get their shas
        for crate_obj in new_ref:
            if crate_obj["kind"] != "registry" or crate_obj["sha"] is not None:
                continue

            crate = CrateRegistry(
                self, crate_obj["name"], crate_obj["version"]
            )

            crate_url, auth_scheme = crate._get_url()
            with self.timed_activity(
                f"Downloading: {crate_url}", silent_nested=True
            ):
                crate_obj["sha"] = crate._download(crate_url, auth_scheme)

        return new_ref

    def stage(self, directory):
        # Stage the crates into the vendor directory
        vendor_dir = os.path.join(directory, self.vendor_dir)
        cargo_config = {"source": {}}

        cargo_config["source"]["crates-io"] = {
            "registry": self.translate_url(self.url),
            "replace-with": "vendored-sources",
        }

        # Every git repo needs an extra entry in the config
        for crate in self.crates:
            crate.stage(vendor_dir)
            if isinstance(crate, CrateGit):
                translated_url = self.translate_url(crate.repo, primary=False)
                section = {
                    "git": translated_url,
                    "replace-with": "vendored-sources",
                }

                # Options like branch, tag, rev have to be specified in the config
                # if they were specified in the Cargo.toml. Otherwise cargo will not
                # find the crate.
                if crate.query:
                    query = "?" + urlencode(crate.query)
                    for key, value in crate.query.items():
                        section[key] = value
                else:
                    query = ""

                source_id = f"git+{translated_url}{query}"

                cargo_config["source"][source_id] = section

        cargo_config["source"]["vendored-sources"] = {
            "directory": self.vendor_dir
        }

        conf_dir = os.path.join(directory, ".cargo")
        conf_file = os.path.join(conf_dir, "config.toml")
        os.makedirs(conf_dir, exist_ok=True)
        with open(conf_file, "w", encoding="utf-8") as f:
            tomlkit.dump(cargo_config, f)

    def get_source_fetchers(self):
        return self.crates

    ########################################################
    #      Helper APIs for CrateGit and Cargo to use       #
    ########################################################

    # mirrored_git_url():
    #
    # Applies the defined "git-mirrors" mappings to a git URL.
    #
    # Args:
    #    (str) git_url: The raw URL from the element
    #
    # Returns:
    #    (str): The git URL with potentially mirror applied
    #
    def mirrored_git_url(self, git_url):
        use_mirror: None | tuple = None
        for url, mirror in self.git_mirrors.items():
            if git_url.startswith(url) and (
                use_mirror is None or len(use_mirror[0]) < len(url)
            ):
                # Use the most specific (longest) URL
                use_mirror = (url, mirror.as_str())

        if use_mirror is not None:
            return git_url.replace(use_mirror[0], use_mirror[1])
        return git_url

    ########################################################
    #                   Private helpers                    #
    ########################################################

    def _recompute_crates(self, ref):
        self.crates = self._parse_crates(ref)

        self.ref = [crate.ref_node() for crate in self.crates]

    # _parse_crates():
    #
    # Generates a list of crates based on the passed ref
    #
    # Args:
    #    (list|None) refs: The list of name/version dictionaries
    #
    # Returns:
    #    (list): A list of Crate objects
    #
    def _parse_crates(self, refs):
        # Return an empty list for no ref
        if refs is None:
            return []

        crates = []

        for crate in refs:
            kind = crate.get_str("kind", default="registry")

            provenance = crate.get_mapping("provenance", None)

            if provenance is not None and utils.get_bst_version() < (2, 7):
                raise SourceError(
                    f"{self._get_provenance()}: Source provenance for cargo2 is only supported with buildstream 2.7 or later"
                )

            if kind == "git":
                crates.append(
                    CrateGit(
                        self,
                        crate.get_str("name"),
                        crate.get_str("version"),
                        self.mirrored_git_url(crate.get_str("repo")),
                        crate.get_str("commit"),
                        {
                            k: v.as_str()
                            for k, v in crate.get_mapping("query", {}).items()
                        },
                        provenance,
                    )
                )
            else:
                crates.append(
                    CrateRegistry(
                        self,
                        crate.get_str("name"),
                        crate.get_str("version"),
                        sha=crate.get_str("sha", None),
                        provenance=provenance,
                    )
                )

        return crates

    def export_manifest(self):
        return [
            crate.export_manifest() for crate in self.get_source_fetchers()
        ]


def setup():
    return CargoSource


# Code for `download_file`
#
# Copied from buildstream-plugins project:
# <https://github.com/apache/buildstream-plugins/blob/db71610b7ae9884f6d8cbe0d3cc5a1c657c19edb/src/buildstream_plugins/sources/_utils.py>
#
# Previously mostly copied from downloadablefilesource.py in buildstream.


class _NetrcPasswordManager:
    def __init__(self, netrc_config):
        self.netrc = netrc_config

    def add_password(self, realm, uri, user, passwd):
        pass

    def find_user_password(self, realm, authuri):
        if not self.netrc:
            return None, None
        parts = urllib.parse.urlsplit(authuri)
        entry = self.netrc.authenticators(parts.hostname)
        if not entry:
            return None, None
        login, _, password = entry
        return login, password


def _parse_netrc():
    netrc_config = None
    # If the .netrc file was not found, FileNotFoundError will be
    # raised, but OSError will be raised directly by the netrc package
    # in the case that $HOME is not set.
    #
    # This will catch both cases.
    with contextlib.suppress(OSError, netrc.NetrcParseError):
        netrc_config = netrc.netrc()

    return netrc_config


class _UrlOpenerCreator:
    def __init__(self, netrc_config):
        self.netrc_config = netrc_config

    def get_url_opener(self, bearer_auth):
        if self.netrc_config and not bearer_auth:
            netrc_pw_mgr = _NetrcPasswordManager(self.netrc_config)
            http_auth = urllib.request.HTTPBasicAuthHandler(netrc_pw_mgr)
            return urllib.request.build_opener(http_auth)
        return urllib.request.build_opener()


def download_file(url, etag, directory, auth_scheme):
    opener_creator = _UrlOpenerCreator(_parse_netrc())
    opener = opener_creator.get_url_opener(auth_scheme == "bearer")
    default_name = os.path.basename(url)
    request = urllib.request.Request(url)
    request.add_header("Accept", "*/*")
    request.add_header("User-Agent", "BuildStream/2")

    if opener_creator.netrc_config and auth_scheme == "bearer":
        parts = urllib.parse.urlsplit(url)
        entry = opener_creator.netrc_config.authenticators(parts.hostname)
        if entry:
            _, _, password = entry
            auth_header = "Bearer " + password
            request.add_header("Authorization", auth_header)

    if etag is not None:
        request.add_header("If-None-Match", etag)

    try:
        with contextlib.closing(opener.open(request)) as response:
            info = response.info()

            # some servers don't honor the 'If-None-Match' header
            if etag and info["ETag"] == etag:
                return None, None, None

            etag = info["ETag"]
            length = info.get("Content-Length")

            filename = info.get_filename(default_name)
            filename = os.path.basename(filename)
            local_file = os.path.join(directory, filename)
            with open(local_file, "wb") as dest:
                shutil.copyfileobj(response, dest)

                actual_length = dest.tell()
                if length and actual_length < int(length):
                    raise ValueError(f"Partial file {actual_length}/{length}")

    except urllib.error.HTTPError as e:
        if e.code == 304:
            # 304 Not Modified.
            # Because we use etag only for matching ref, currently specified ref is what
            # we would have downloaded.
            return None, None, None

        return None, None, str(e)
    except (urllib.error.URLError, OSError, ValueError) as e:
        # Note that urllib.request.Request in the try block may throw a
        # ValueError for unknown url types, so we handle it here.
        return None, None, str(e)

    return local_file, etag, None

