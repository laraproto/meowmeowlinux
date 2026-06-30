kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/common.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst
  - bootstrap/glibc.bst

sources:
  - kind: gnu
    name: gcc

variables:
  conf-cmd: "%{build-root}/libstdc++-v3/configure"
  conf-args: |
    --host=%{triplet} -build=$(../config.guess) \
    --prefix=%{bootstrap} \
    --disable-multilib --disable-nls --disable-libstdcxx-pch \
    --with-gxx-include-dir=/bootstrap/tools/%{triplet}/include/c++/16.1.0
