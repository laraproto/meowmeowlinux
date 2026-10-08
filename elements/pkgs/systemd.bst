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
  - pkgs/python.bst
  - pkgs/gettext.bst
  - pkgs/cmake.bst

depends:
  - pkgs/zstd.bst
  - pkgs/openssl3.bst
  - pkgs/curl.bst
  - pkgs/bzip2.bst
  - pkgs/lz4.bst
  - pkgs/xz.bst
  - pkgs/zstd.bst
  - pkgs/pcre2.bst
  - pkgs/linux-pam.bst
  # - pkgs/util-linux.bst # Broken
  - pkgs/userdb.bst
  - pkgs/os-release.bst
  - pkgs/libffi.bst

variables:
  meson-local: >-
    -D sbat-distro=meowmeowlinux 
    -D sbat-distro-summary="Meow Meow Linux"
    -D sbat-distro-url="https://git.hackclub.app/meowmeowlinux"
    -D sbat-distro-version="rolling"
