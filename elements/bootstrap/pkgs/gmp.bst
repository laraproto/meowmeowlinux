kind: autotools

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
  - kind: gnu
    name: gmp

build-depends:
  - bootstrap/tools/import-fdo.bst
  - bootstrap/pkgs/stage1/gcc.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/pkgs/glibc.bst
  - bootstrap/pkgs/linux-headers.bst
  - bootstrap/tools/sysroot-setup.bst

environment:
  CC: "%{triplet}-gcc"
  AR: "%{triplet}-ar"
  RANLIB: "%{triplet}-ranlib"

variables:
  build-dir: build

config:
  configure-commands:
    - |
      %{autogen}
    - |
      sed -i '/long long t1;/,+1s/()/(...)/' configure
      %{configure}
