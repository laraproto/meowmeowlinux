kind: autotools

sources:
- kind: gnu
  name: automake

(@):
  - elements/bootstrap/include/common.yml

build-depends:
- bootstrap/tools/toolchain.bst
