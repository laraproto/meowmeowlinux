kind: autotools

sources:
  - kind: git_repo
    url: github:stevegrubb/libcap-ng
    track: v*.*.*
    exclude:
      - "*-*"

build-depends:
  - groups/autotools.bst
  - pkgs/linux/headers.bst
  - pkgs/systemd.bst
  - pkgs/autoconf.bst
  - pkgs/m4.bst
  - pkgs/diffutils.bst
  - pkgs/pkgconf.bst
  - pkgs/automake.bst
  - pkgs/libtool.bst
  - pkgs/findutils.bst
