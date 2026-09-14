kind: autotools

(@):
  - elements/bootstrap/include/cross.yml
  - elements/bootstrap/include/sysroot.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - filename:
      - bootstrap/linux-headers.bst
      - bootstrap/libstdcxx.bst
      - bootstrap/glibc.bst
    config:
      location: "%{sysroot}"
  - bootstrap/gcc-stage1.bst

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
    --host=%{triplet} 
    --build=$(%{build-root}/config.guess)
    --target=%{triplet} 
    --with-build-sysroot=/sysroot
    --enable-default-pie
    --enable-default-ssp
    --disable-fixincludes
    --disable-nls
    --disable-multilib
    --disable-libatomic
    --disable-libgomp
    --disable-libquadmath
    --disable-libsanitizer
    --disable-libssp
    --disable-libvtv
    --enable-languages=c,c++
    CXX_FOR_TARGET="%{triplet}-gcc -nostdinc++"
    LDFLAGS_FOR_TARGET=-L$PWD/%{triplet}/libgcc
    target_configargs=gcc_cv_target_thread_file=posix

config:
  install-commands:
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      ln -sv gcc %{install-root}/usr/bin/cc
