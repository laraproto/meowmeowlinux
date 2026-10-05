kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: tar
    url: github:rockdaboot/libpsl/releases/download/0.23.3/libpsl-0.23.3.tar.gz

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/pkg-config.bst
