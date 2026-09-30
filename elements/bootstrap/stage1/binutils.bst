kind: autotools

build-depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: binutils

variables:
  conf-local: >-
    --disable-nls
    --enable-gprofng=no
    --disable-werror
    --enable-new-dtags
    --enable-default-hash-style=gnu
    --without-debuginfod

config:
  install-commands:
    (>):
      - rm -rf %{install-root}%{datadir}/info
      - rm -rf %{install-root}%{libdir}/bfd-plugins
