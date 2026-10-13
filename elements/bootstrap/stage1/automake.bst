kind: autotools

(@): 
  - elements/bootstrap/common.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/make.bst

depends:
  - bootstrap/stage1/perl.bst

sources:
  - kind: gnu
    name: automake
