kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: gnu
    name: gperf

build-depends:
  - bootstrap/stage1/independent.bst
