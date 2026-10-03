kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/base.bst

depends:
  - bootstrap/stage1/attr.bst
  - bootstrap/stage1/zstd.bst

sources:
  - kind: gnu
    name: gcc
  - kind: gnu
    name: mpfr
    directory: mpfr
  - kind: gnu
    name: mpc
    directory: mpc
  - kind: gnu
    name: gmp
    directory: gmp

variables:
  conf-local: >-
    --disable-multilib
    --disable-bootstrap
    --disable-libssp
    --enable-default-pie
    --enable-default-ssp
    --enable-linker-build-id
    --enable-shared
    --enable-languages=c,c++

config:
  install-commands:
    (>):
      - |
        ln -sv gcc /tools/bin/cc
