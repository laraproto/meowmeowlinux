kind: autotools

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
  - kind: gnu
    name: binutils

build-depends:
  - bootstrap/freedesktop-sdk.bst:components/texinfo.bst
  - bootstrap/tools/import-fdo.bst
  - bootstrap/pkgs/stage1/gcc.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/pkgs/glibc.bst
  - bootstrap/pkgs/linux-headers.bst

variables:
  build-dir: build
  conf-local: >-
    --target=%{triplet} --build=$(../config.guess) --with-lib-path=%{libdir}
    --disable-nls --enable-new-dtags --disable-werror
    --with-sysroot=%{bootstrap-sysroot} --disable-gprofng --enable-shared
    --with-headers=%{bootstrap-prefix}/include

config:
  configure-commands:
    (>):
      - |
        export CFLAGS="-DPATH_MAX=4096 $CFLAGS"
        sed '6031s/$add_dir//' -i ltmain.sh
        sed 's/PATH_MAX/4096/' -i ld/ldmain.c

  install-commands:
    # Adjusted linker for post-bootstrap. Will be used between final glibc & final binutils
    - |
      make -C %{build-dir}/ld clean
      make -C %{build-dir}/ld LIB_PATH=/usr/lib

      mkdir -pv %{install-root}/usr/bin
      cp -v %{build-dir}/ld/ld-new %{install-root}/usr/bin
