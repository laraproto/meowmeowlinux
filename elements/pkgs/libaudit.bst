kind: autotools

sources:
  - kind: git_repo
    url: github:linux-audit/audit-userspace
    track: v*.*.*
    exclude:
      - "*-*"

build-depends:
  - groups/autotools.bst
  - pkgs/linux/headers.bst
  - pkgs/systemd.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/libcap-ng.bst
  - pkgs/m4.bst
  - pkgs/diffutils.bst
  - pkgs/pkgconf.bst
  - pkgs/openssl3.bst
  - pkgs/libtool.bst
  - pkgs/findutils.bst

variables:
  conf-local: >-
    --disable-zos-remote
