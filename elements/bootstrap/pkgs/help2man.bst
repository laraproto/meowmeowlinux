kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: help2man

depends:
- bootstrap/pkgs/glibc.bst

build-depends:
- bootstrap/tools/toolchain.bst
