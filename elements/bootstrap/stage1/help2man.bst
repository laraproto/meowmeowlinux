kind: autotools

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: gnu
    name: help2man

build-depends:
  - bootstrap/stage1/base.bst
