kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/gcc-stage1.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/glibc.bst
  - bootstrap/linux-headers.bst
  - bootstrap/sysroot.bst

sources:
  - kind: gnu
    name: binutils

environment:
  CC: "%{triplet}-gcc"
  AR: "%{triplet}-ar"
  RANLIB: "%{triplet}-ranlib"

variables:
  build-dir: build
  conf-local: >-
    --prefix=%{bootstrap-prefix}
    --with-sysroot=%{bootstrap-sysroot}
    --with-lib-path=%{libdir}
    --build=$(%{build-root}/config.guess)
    --host=%{triplet}
    --disable-nls
    --enable-shared
    --enable-gprofng=no
    --disable-werror
    --enable-64-bit-bfd
    --enable-new-dtags
    --enable-default-hash-style=gnu

config:
  install-commands:
    (>):
    - ln -sv lib %{install-root}%{prefix}/lib64
    - rm -rf %{install-root}%{datadir}/info
    - rm -rf %{install-root}%{libdir}/bfd-plugins
