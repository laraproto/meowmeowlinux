kind: autotools

(@):
  - elements/bootstrap/include/sysroot.yml
  - elements/bootstrap/include/common.yml

sources:
  - kind: gnu
    name: diffutils

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
    gl_cv_func_strcasecmp_works=yes
    --build=$(%{build-root}/build-aux/config.guess)
