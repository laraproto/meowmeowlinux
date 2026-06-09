kind: autotools

sources:
- kind: gnu
  name: coreutils

build-depends:
- tools/toolchain.bst

environment:
  FORCE_UNSAFE_CONFIGURE: "1"
