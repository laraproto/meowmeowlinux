kind: autotools

(@):
  - elements/bootstrap/include/sysroot.yml
  - elements/bootstrap/include/common.yml

sources:
  - kind: gnu
    name: m4

build-depends:
  - filename:
      - bootstrap/linux-headers.bst
      - bootstrap/glibc.bst
    config:
      location: "%{sysroot}"
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet}
    --build=$(%{build-root}/build-aux/config.guess)
