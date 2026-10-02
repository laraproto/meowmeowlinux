kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/base.bst

depends:
  - bootstrap/stage1/mpfr.bst
  - bootstrap/stage1/gmp.bst

sources:
  - kind: gnu
    name: gawk
