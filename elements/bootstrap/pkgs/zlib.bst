kind: autotools
description: Contains various compression/decompression routines

sources:
- kind: git_tag
  url: github:madler/zlib
  track: v1.3.2

depends:
- bootstrap/pkgs/glibc.bst

build-depends:
- bootstrap/tools/toolchain.bst

# zlib's configure is very picky...
variables:
  conf-args: >-
    --prefix=%{prefix}
    --libdir=%{libdir}
    --sharedlibdir=%{libdir}
