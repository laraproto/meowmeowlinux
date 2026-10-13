kind: autotools

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: gnu
    name: gperf

build-depends:
  - bootstrap/stage1/independent.bst
