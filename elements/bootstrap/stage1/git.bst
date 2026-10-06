kind: meson

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:git/git
    track: v*.*.*
    exclude:
    - "*-*"

build-depends:
  - bootstrap/stage1/rust.bst
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/gcc.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/findutils.bst
  - bootstrap/stage1/diffutils.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/expat.bst
  - bootstrap/stage1/meson.bst

depends:
  - bootstrap/stage1/openssl3.bst
  - bootstrap/stage1/zlib.bst
  - bootstrap/stage1/curl.bst
  - bootstrap/stage1/perl.bst

variables:
  meson-local: >-
    -D tests=false
    -D benchmarks=disabled

    -D git_gui=disabled
    -D gitk=disabled

    -D coccinelle=disabled

environment:
  LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
  LD_LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
