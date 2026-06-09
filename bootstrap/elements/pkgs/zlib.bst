kind: autotools
description: Contains various compression/decompression routines

sources:
- kind: git_tag
  url: github:madler/zlib

depends:
- pkgs/glibc.bst

build-depends:
- tools/toolchain.bst

# zlib's configure is very picky...
variables:
  conf-args: >-
    --prefix=%{prefix}
    --libdir=%{libdir}
    --sharedlibdir=%{libdir}
