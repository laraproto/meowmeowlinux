kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: gzip

build-depends:
- bootstrap/tools/toolchain.bst
