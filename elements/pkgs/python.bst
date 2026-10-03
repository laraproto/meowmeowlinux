kind: autotools

(@): 
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/stage1.bst
  - bootstrap/linker.bst

sources:
- kind: git_repo
  track: v*
  exclude:
  - v*a*
  - v*b*
  - v*rc*
  url: github:python/cpython.git

variables:
  conf-local: --enable-shared  --without-static-libpython --without-ensurepip --with-system-expat --enable-optimizations 

