kind: autotools
description: Contains various compression/decompression routines

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: git_tag
  url: github:madler/zlib
  track: v1.3.2

depends:
- bootstrap/pkgs/stage1/glibc.bst

build-depends:
- bootstrap/tools/toolchain.bst

# zlib's configure is very picky...
variables:
  conf-args: >-
    --prefix=%{bootstrap-prefix}
    --libdir=%{libdir}
    --sharedlibdir=%{libdir}
