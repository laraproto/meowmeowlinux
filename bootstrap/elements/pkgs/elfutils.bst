kind: autotools

sources:
- kind: git_tag
  url: sourceware:elfutils.git

depends:
- pkgs/glibc.bst
- pkgs/zlib.bst
- pkgs/flex.bst

build-depends:
- tools/toolchain.bst

variables:
  conf-local: >-
    --disable-debuginfod
    --disable-libdebuginfod
    --enable-maintainer-mode
