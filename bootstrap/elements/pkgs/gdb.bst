kind: autotools
description: Minimal build of GDB, for gdb-add-index

sources:
- kind: gnu
  name: gdb

depends:
- pkgs/zlib.bst
- pkgs/xz.bst
- pkgs/gmp.bst

build-depends:
- tools/toolchain.bst

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

