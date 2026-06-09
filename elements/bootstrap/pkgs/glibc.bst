kind: autotools

sources:
- kind: gnu
  name: glibc

build-depends:
- bootstrap/tools/import-fdo.bst
- bootstrap/pkgs/gcc-cross.bst
- bootstrap/pkgs/binutils-cross.bst
- bootstrap/pkgs/linux-api-headers.bst
- bootstrap/tools/sysroot-setup.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{bootstrap-triplet}
    --build=$(%{build-root}/scripts/config.guess)
    --enable-kernel=5.4
    --with-headers=%{includedir}
    --disable-nscd
    --disable-werror
    --enable-crypt
