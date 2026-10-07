kind: autotools

sources:
  - kind: gnu
    name: tar

build-depends:
  - groups/autotools.bst

variables:
  conf-local: >-
    --without-selinux

environment:
  FORCE_UNSAFE_CONFIGURE: 1
