kind: autotools

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
  - kind: gnu
    name: binutils

build-depends:
  - bootstrap/freedesktop-sdk.bst:components/texinfo.bst
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

(@):
  - elements/bootstrap/include/common.yml

variables:
  build-dir: build
  conf-local: >-
    --with-lib-path=%{libdir} --disable-nls --disable-werror --with-sysroot
    --disable-gprofng --enable-shared

config:
  configure-commands:
    (>):
      - |
        export CFLAGS="-DPATH_MAX=4096 $CFLAGS"
        sed '6031s/$add_dir//' -i ltmain.sh

  install-commands:
    # Adjusted linker for post-bootstrap. Will be used between final glibc & final binutils
    - |
      make -C %{build-dir}/ld clean
      make -C %{build-dir}/ld LIB_PATH=/usr/lib
      cp -v %{build-dir}/ld/ld-new %{install-root}%{bindir}

    # Delete .info files because they overlap binutils-cross and for whatever reason overlap-whitelist doesn't work
    - |
      rm -v %{install-root}%{datadir}/info/{dir,*.info}
