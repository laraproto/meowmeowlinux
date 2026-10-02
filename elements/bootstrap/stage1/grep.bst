kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: gnu
    name: grep

build-depends:
  - bootstrap/stage1/base.bst
