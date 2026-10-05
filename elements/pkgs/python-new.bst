kind: autotools

build-depends:
  - groups/autotools.bst
  - pkgs/findutils.bst
  - pkgs/gmp.bst

depends:
  - pkgs/expat.bst
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
  conf-local: --enable-shared  --without-static-libpython --with-system-expat --enable-optimizations CFLAGS="-Wno-error=stringop-truncation"

config:
  install-commands:
    (>):
      - |
        ln -sv python3 %{install-root}/usr/bin/python
      
