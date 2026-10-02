# This is temporary until gawk gets fixed upstream.

(@):
  - elements/bootstrap/stage1/common.yml

kind: autotools

build-depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: gmp

variables:
  conf-local: CFLAGS="-std=c17"
