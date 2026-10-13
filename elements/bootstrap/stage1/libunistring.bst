kind: autotools

(@): 
  - elements/bootstrap/common.yml

build-depends:
  - bootstrap/stage1/independent.bst

sources:
  - kind: gnu
    name: libunistring

