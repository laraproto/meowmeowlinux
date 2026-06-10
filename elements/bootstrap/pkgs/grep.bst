kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: grep

build-depends:
- bootstrap/tools/toolchain.bst
