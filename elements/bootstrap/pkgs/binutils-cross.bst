kind: autotools
description: |
  Binutils needs to be the first thing built because gcc's configure script will look for it

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
- kind: gnu
  name: binutils

build-depends:
  - bootstrap/freedesktop-sdk.bst:components/texinfo.bst
  - bootstrap/tools/import-fdo.bst


variables:
  build-dir: build
  conf-local: >-
    --with-sysroot=%{bootstrap-sysroot} --target=%{bootstrap-triplet}
    --with-lib-path=%{libdir} --disable-nls --disable-werror --disable-plugins

config:
  install-commands:
    (>):
<<<<<<< HEAD
    - ln -sv lib %{install-root}%{bootstrap-prefix}/lib64
    - rm -rf %{install-root}%{datadir}/info
    - rm -rf %{install-root}%{libdir}/bfd-plugins
=======
      - ln -sv lib %{install-root}%{prefix}/lib64
      - rm -rf %{install-root}%{datadir}/info
      - rm -rf %{install-root}%{libdir}/bfd-plugins
>>>>>>> 2240b995ad7725bff83c5f06848a198750cdb7b1
