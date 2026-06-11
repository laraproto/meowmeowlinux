kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: help2man

depends:
- bootstrap/pkgs/stage1/glibc.bst

build-depends:
- bootstrap/tools/toolchain.bst
