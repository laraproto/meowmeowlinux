kind: autotools

sources:
- kind: gnu
  name: bash

depends:
- pkgs/ncurses.bst

build-depends:
- tools/toolchain.bst

variables:
  conf-local: --without-bash-malloc

config:
  install-commands:
    (>):
    - ln -sv bash %{install-root}%{bindir}/sh
