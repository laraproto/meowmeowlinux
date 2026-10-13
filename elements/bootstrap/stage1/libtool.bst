kind: autotools

(@):
  - elements/bootstrap/common.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/m4.bst

depends:
  - bootstrap/env.bst

sources:
  - kind: gnu
    name: libtool
