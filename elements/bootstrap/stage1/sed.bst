kind: autotools

sources:
  - kind: gnu
    name: sed

build-depends:
  - bootstrap/stage1/base.bst

variables:
  conf-local: --without-selinux
