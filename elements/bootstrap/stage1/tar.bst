kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: tar

variables:
  conf-local: >-
    --without-xattrs
    --without-selinux
    --without-posix-acls

environment:
  FORCE_UNSAFE_CONFIGURE: 1
