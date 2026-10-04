kind: autotools

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/ncurses.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - pkgs/glibc.bst
  - pkgs/gcc.bst
  - pkgs/zstd.bst
  - pkgs/gawk.bst

sources:
  - kind: gnu
    name: bash

variables:
  conf-local: |
    --without-bash-malloc

config:
  install-commands:
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      ln -s bash %{install-root}/usr/bin/sh
