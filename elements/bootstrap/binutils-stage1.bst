kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst

sources:
  - kind: gnu
    name: binutils

variables:
  conf-local: |
    --prefix=%{tools}          \
    --with-sysroot=%{tools}    \
    --target=%{triplet}        \
    --disable-nls              \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-new-dtags         \
    --enable-default-hash-style=gnu
