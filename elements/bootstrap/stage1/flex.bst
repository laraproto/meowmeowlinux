kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:westes/flex
    track: v*.*.*

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/gettext.bst
  - bootstrap/stage1/meson.bst
  - bootstrap/stage1/libtool.bst
  - bootstrap/stage1/tar.bst
  - bootstrap/stage1/gzip.bst
  - bootstrap/stage1/findutils.bst
  - bootstrap/stage1/bison.bst
  - bootstrap/stage1/fdo.bst:components/flex.bst
