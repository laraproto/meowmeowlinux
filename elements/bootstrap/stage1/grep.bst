kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

depends:
  - bootstrap/stage1/pcre2.bst

sources:
  - kind: gnu
    name: grep

build-depends:
  - bootstrap/stage1/base.bst
