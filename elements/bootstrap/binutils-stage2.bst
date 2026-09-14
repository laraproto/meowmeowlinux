kind: autotools

(@):
  - elements/bootstrap/include/cross.yml
  - elements/bootstrap/include/sysroot.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - filename:
      - bootstrap/linux-headers.bst
      - bootstrap/glibc.bst
    config:
      location: "%{sysroot}"
  - bootstrap/gcc-stage1.bst

sources:
  - kind: gnu
    name: binutils

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet}
    --build=$(%{build-root}/config.guess)
    --disable-nls
    --enable-shared
    --enable-gprofng=no
    --disable-werror
    --enable-new-dtags
    --enable-default-hash-style=gnu

  configure: |
    sed '6031s/$add_dir//' -i ltmain.sh

    mkdir -p "%{build-dir}"
    cd "%{build-dir}"
    %{conf-cmd} %{conf-args}

environment:
  _GCC_AUTOCONF_VERSION_CHECK: false
