kind: autotools

(@): 
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/independent.bst

sources:
  - kind: gnu
    name: libunistring

