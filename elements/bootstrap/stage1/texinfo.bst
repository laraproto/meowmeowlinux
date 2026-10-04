kind: autotools

(@): 
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/perl.bst
  - bootstrap/stage1/libunistring.bst

sources:
  - kind: gnu
    name: texinfo

