kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/common.yml

sources:
  - kind: gnu
    name: m4

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst
  - bootstrap/glibc.bst
  - bootstrap/libstdcxx.bst
  - bootstrap/linux-headers.bst
  - bootstrap/sysroot.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet}
    --build=$(%{build-root}/build-aux/config.guess)
