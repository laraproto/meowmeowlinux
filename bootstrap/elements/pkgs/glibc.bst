kind: autotools

sources:
- kind: gnu
  name: glibc

build-depends:
- tools/import-fdo.bst
- pkgs/gcc-cross.bst
- pkgs/binutils-cross.bst
- pkgs/linux-api-headers.bst
- tools/sysroot-setup.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{bootstrap-triplet}
    --build=$(%{build-root}/scripts/config.guess)
    --enable-kernel=5.0
    --with-headers=%{includedir}
    --disable-werror
    --enable-crypt
