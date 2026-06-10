kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: make

build-depends:
- bootstrap/tools/toolchain.bst

variables:
  conf-local: >-
    --without-guile
    --disable-nls
