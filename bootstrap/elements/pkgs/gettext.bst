kind: autotools

sources:
- kind: gnu
  name: gettext

depends:
- pkgs/ncurses.bst

build-depends:
- tools/toolchain.bst

variables:
  conf-local: --without-xz --without-bzip2
