kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: sed

build-depends:
- bootstrap/tools/toolchain.bst
