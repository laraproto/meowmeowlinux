kind: autotools

sources:
- kind: gnu
  name: tar

build-depends:
- tools/toolchain.bst

environment:
  FORCE_UNSAFE_CONFIGURE: "1"
