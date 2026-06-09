kind: autotools

sources:
- kind: gnu
  name: make

build-depends:
- tools/toolchain.bst

variables:
  conf-local: >-
    --without-guile
    --disable-nls
