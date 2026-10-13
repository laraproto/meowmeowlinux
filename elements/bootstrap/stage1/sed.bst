kind: autotools

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: gnu
    name: sed

build-depends:
  - bootstrap/stage1/base.bst
  - bootstrap/stage1/help2man.bst

depends:
  - bootstrap/stage1/attr.bst

variables:
  conf-local: --without-selinux
