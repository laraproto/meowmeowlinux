kind: autotools

sources:
- kind: gnu
  name: make

build-depends:
- bootstrap/tools/toolchain.bst

variables:
  conf-local: >-
    --without-guile
    --disable-nls
