kind: autotools

(@):
  - elements/bootstrap/include/sysroot.yml
  - elements/bootstrap/include/common.yml

sources:
  - kind: gnu
    name: coreutils

build-depends:
  - filename:
      - bootstrap/linux-headers.bst
      - bootstrap/glibc.bst
    config:
      location: "%{sysroot}"
  - bootstrap/base.bst
  - bootstrap/libstdcxx.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet}
    --build=$(%{build-root}/build-aux/config.guess)
    --enable-install-program=hostname
