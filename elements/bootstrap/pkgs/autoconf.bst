kind: autotools

sources:
- kind: gnu
  name: autoconf

(@):
  - elements/bootstrap/include/common.yml

build-depends:
- bootstrap/tools/toolchain.bst
