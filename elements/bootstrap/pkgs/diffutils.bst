kind: autotools

sources:
- kind: gnu
  name: diffutils

(@):
  - elements/bootstrap/include/common.yml

build-depends:
- bootstrap/tools/toolchain.bst
