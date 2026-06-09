kind: autotools
description: |
  Binutils needs to be the first thing built because gcc's configure script will look for it

sources:
- kind: gnu
  name: binutils

build-depends:
- freedesktop-sdk.bst:components/texinfo.bst
- tools/import-fdo.bst

variables:
  build-dir: build
  conf-local: >-
    --with-sysroot=%{bootstrap-sysroot}
    --target=%{bootstrap-triplet}
    --with-lib-path=%{libdir}
    --disable-nls --disable-werror --disable-plugins

config:
  install-commands:
    (>):
    - ln -sv lib %{install-root}%{prefix}/lib64
    - rm -rf %{install-root}%{datadir}/info
    - rm -rf %{install-root}%{libdir}/bfd-plugins
