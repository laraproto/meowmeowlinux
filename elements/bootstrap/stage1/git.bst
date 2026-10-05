kind: make

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:git/git
    track: v*.*.*
    exclude:
    - v*.*.*rc*

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/m4.bst

depends:
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/perl.bst
  - bootstrap/stage1/diffutils.bst
  - bootstrap/stage1/openssl3.bst
  - bootstrap/stage1/zlib.bst
  - bootstrap/stage1/curl.bst
