kind: autotools

sources:
- kind: gnu
  name: gawk

build-depends:
- bootstrap/tools/toolchain.bst

(@):
  - elements/bootstrap/include/common.yml
