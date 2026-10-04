kind: autotools

(@): 
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/libtool.bst

sources:
 - kind: git_tag
   url: github:libexpat/libexpat
   track: master

config:
  configure-commands:
    (<):
      - |
        mv -fv expat/* .
