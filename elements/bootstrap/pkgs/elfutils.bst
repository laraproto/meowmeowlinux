kind: autotools

sources:
- kind: git_tag
  url: sourceware:elfutils.git
  track: elfutils-0.195

depends:
- bootstrap/pkgs/glibc.bst
- bootstrap/pkgs/zlib.bst
- bootstrap/pkgs/flex.bst

build-depends:
- bootstrap/tools/toolchain.bst

(@):
  - elements/bootstrap/include/common.yml

variables:
  conf-local: >-
    --disable-debuginfod
    --disable-libdebuginfod
    --enable-maintainer-mode
