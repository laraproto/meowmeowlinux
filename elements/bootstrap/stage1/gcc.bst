kind: autotools

depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: gcc
  - kind: gnu
    name: mpfr
    directory: mpfr
  - kind: gnu
    name: mpc
    directory: mpc
  - kind: gnu
    name: gmp
    directory: gmp

variables:
  conf-local: >-
    --with-newlib
    --without-headers
    --enable-default-pie
    --disable-fixincludes 
    --disable-shared 
    --disable-multilib
    --disable-libsanitizer 
    --disable-nls
    --enable-default-ssp
    --disable-libssp
    --disable-libatomic
    --disable-libgomp
    --disable-libquadmath
    --disable-libvtv
    --enable-languages=c,c++
