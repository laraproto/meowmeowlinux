kind: autotools

sources:
  - kind: gnu
    name: coreutils

build-depends:
  - bootstrap/stage1/base.bst

variables:
  conf-local: --without-selinux

environment:
  FORCE_UNSAFE_CONFIGURE: 1
