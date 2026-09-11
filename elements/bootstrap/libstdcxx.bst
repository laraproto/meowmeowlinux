kind: autotools

(@):
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - filename:
      - bootstrap/linux-headers.bst
      - bootstrap/glibc.bst
    config:
      location: "%{sysroot}"
  - bootstrap/gcc-stage1.bst

sources:
  - kind: gnu
    name: gcc

variables:
  conf-cmd: "%{build-root}/libstdc++-v3/configure"
  gcc-version: $(%{triplet}-gcc -dumpversion)
  conf-local: >-
    --host=%{triplet} --build=$(%{build-root}/config.guess)
    CXX=%{triplet}-gcc
    CPPFLAGS=-I%{sysroot}/usr/include
    --disable-multilib --disable-nls
    --disable-libstdcxx-pch
    --with-headers=%{sysroot}/usr/include:%{includedir}
    --with-gxx-include-dir=%{bootstrap-prefix}/%{triplet}/include/c++/%{gcc-version}

environment:
  CFLAGS: "-B/sysroot/usr/lib/"
  LDFLAGS: "-B/sysroot/usr/lib/"
