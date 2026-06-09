kind: autotools

sources:
- kind: gnu
  name: gettext

depends:
- bootstrap/pkgs/ncurses.bst

build-depends:
- bootstrap/tools/toolchain.bst

variables:
  conf-local: --without-xz --without-bzip2
