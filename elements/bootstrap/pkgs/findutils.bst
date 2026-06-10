kind: autotools

sources:
- kind: gnu
  name: findutils

build-depends:
- bootstrap/tools/toolchain.bst

(@):
  - elements/bootstrap/include/common.yml
