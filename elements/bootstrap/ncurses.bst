kind: autotools

(@):
  - elements/bootstrap/include/sysroot.yml
  - elements/bootstrap/include/common.yml

sources:
  - kind: tar
    url: invisible-mirror:ncurses/ncurses-6.6.tar.gz

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
    --mandir=/usr/share/man
    --with-manpage-format=normal
    --with-shared
    --without-normal
    --with-cxx-shared
    --without-debug
    --without-ada
    --disable-stripping
    --libdir=%{sysroot}/usr/lib
    AWK=gawk
