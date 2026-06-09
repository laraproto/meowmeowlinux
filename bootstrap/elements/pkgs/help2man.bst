kind: autotools

sources:
- kind: gnu
  name: help2man

depends:
- pkgs/glibc.bst

build-depends:
- tools/toolchain.bst
