kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: m4

build-depends:
- bootstrap/tools/toolchain.bst

variables:
  conf-local: --disable-gcc-warnings
