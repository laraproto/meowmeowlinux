kind: autotools

sources:
- kind: gnu
  name: gmp

build-depends:
- bootstrap/tools/import-fdo.bst
- bootstrap/pkgs/gcc-cross.bst
- bootstrap/pkgs/binutils-cross.bst
- bootstrap/pkgs/glibc.bst
- bootstrap/pkgs/linux-api-headers.bst
- bootstrap/tools/sysroot-setup.bst

environment:
  CC: "%{bootstrap-triplet}-gcc"
  AR: "%{bootstrap-triplet}-ar"
  RANLIB: "%{bootstrap-triplet}-ranlib"

variables:
  build-dir: build
