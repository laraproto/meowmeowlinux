kind: autotools

sources:
- kind: gnu
  name: bash

depends:
- bootstrap/pkgs/ncurses.bst

build-depends:
- bootstrap/tools/toolchain.bst

variables:
  conf-local: --without-bash-malloc

config:
  install-commands:
    (>):
    - ln -sv bash %{install-root}%{bindir}/sh
