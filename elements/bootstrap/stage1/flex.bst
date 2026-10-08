kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: tar
    url: github:westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/gettext.bst
