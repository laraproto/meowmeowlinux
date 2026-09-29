kind: autotools

depends:
  - bootstrap/stage1/base.bst

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
