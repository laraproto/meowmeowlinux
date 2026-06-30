kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/common.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst

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
  build-dir: build
  conf-local: |
    --prefix=%{install-root}/%{tools} \
    --target=%{triplet}   \
    --with-glibc-version=2.43 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-fixincludes     \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++

config:
  install-commands:
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      cat ./gcc/{limitx,glimits,limity}.h > %{install-root}/$(%{triplet}-gcc -print-file-name=include)/limits.h
