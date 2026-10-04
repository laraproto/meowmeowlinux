kind: autotools

(@): 
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/findutils.bst

depends:
  - bootstrap/stage1/expat.bst
  - pkgs/ncurses.bst

sources:
- kind: git_repo
  track: v*
  exclude:
  - v*a*
  - v*b*
  - v*rc*
  url: github:python/cpython.git

variables:
  conf-local: --enable-shared  --without-static-libpython --without-ensurepip --with-system-expat --enable-optimizations CFLAGS="-Wno-error=stringop-truncation"

