# This is temporary until gawk gets fixed upstream.

kind: autotools

build-depends:
  - bootstrap/stage1/base.bst

depends:
  - bootstrap/stage1/gmp.bst

sources:
  - kind: gnu
    name: mpfr
