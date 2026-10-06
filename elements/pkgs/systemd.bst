kind: meson

sources:
  - kind: git_repo
    url: github:systemd/systemd.git
    track: v*
    exclude:
      - "*rc*"

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/diffutils.bst
  - pkgs/findutils.bst
  - pkgs/gperf.bst
  - pkgs/python-jinja2.bst
  - pkgs/python-pefile.bst
  - pkgs/python-elfutils.bst
  - pkgs/python-new.bst

depends:
  - pkgs/zstd.bst
  - pkgs/openssl3.bst
  - pkgs/curl.bst
  - pkgs/bzip2.bst
  - pkgs/lz4.bst
  - pkgs/xz.bst
  - pkgs/pcre2.bst
  - pkgs/linux-pam.bst
  - pkgs/util-linux.bst
