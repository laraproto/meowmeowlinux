kind: autotools
description: A temporary libstdc++ used to build a final bootstrap gcc

sources:
- kind: gnu
  name: gcc

build-depends:
- bootstrap/tools/import-fdo.bst
- bootstrap/pkgs/gcc-cross.bst
- bootstrap/pkgs/binutils-cross.bst
- bootstrap/pkgs/glibc.bst
- bootstrap/pkgs/linux-api-headers.bst
- bootstrap/tools/sysroot-setup.bst

variables:
  build-dir: build
  conf-cmd: '%{build-root}/libstdc++-v3/configure'
  gcc-version: $(%{bootstrap-triplet}-gcc -dumpversion)
  conf-local: >-
    --host=%{bootstrap-triplet}
    --disable-multilib
    --disable-nls
    --disable-libstdcxx-threads
    --disable-libstdcxx-pch
    --with-gxx-include-dir=%{prefix}/%{bootstrap-triplet}/include/c++/%{gcc-version}
