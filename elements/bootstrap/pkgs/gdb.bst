kind: autotools
description: Minimal build of GDB, for gdb-add-index

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: gnu
  name: gdb

depends:
- bootstrap/pkgs/zlib.bst
- bootstrap/pkgs/xz.bst
- bootstrap/pkgs/gmp.bst

build-depends:
- bootstrap/tools/toolchain.bst

variables:
  build-dir: "_builddir"
  conf-local: >-
    --with-separate-debug-dir="%{debugdir}"
  make-args: MAKEINFO=true

config:
  install-commands:
  - |
    cd %{build-dir}
    make -C gdb -j1 DESTDIR="%{install-root}" install
