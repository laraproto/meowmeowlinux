kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: findut

variables:
  conf-local: --without-selinux
