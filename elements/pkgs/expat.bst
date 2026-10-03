kind: autotools

(@): 
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/stage1.bst
  - bootstrap/linker.bst

sources:
 - kind: git_tag
   url: github:libexpat/libexpat
   track: master


