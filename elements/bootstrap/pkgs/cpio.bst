kind: autotools

sources:
- kind: gnu
  name: cpio

build-depends:
- bootstrap/tools/toolchain.bst

(@):
  - elements/bootstrap/include/common.yml

variables:
  conf-local: --with-rmt=%{libexecdir}/rmt

# Will not build w/ GCC 10+ without -fcommon
environment:
  CFLAGS: -fcommon
