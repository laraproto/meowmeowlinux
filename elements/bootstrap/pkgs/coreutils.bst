kind: autotools

sources:
- kind: gnu
  name: coreutils

build-depends:
- bootstrap/tools/toolchain.bst

(@):
  - elements/bootstrap/include/common.yml

environment:
  FORCE_UNSAFE_CONFIGURE: "1"
