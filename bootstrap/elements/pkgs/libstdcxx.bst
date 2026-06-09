kind: autotools
description: A temporary libstdc++ used to build a final bootstrap gcc

sources:
- kind: gnu
  name: gcc

build-depends:
- tools/import-fdo.bst
- pkgs/gcc-cross.bst
- pkgs/binutils-cross.bst
- pkgs/glibc.bst
- pkgs/linux-api-headers.bst
- tools/sysroot-setup.bst

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
