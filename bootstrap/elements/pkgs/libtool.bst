kind: autotools

sources:
- kind: gnu
  name: libtool

build-depends:
- tools/toolchain.bst

variables:
  conf-local: SED=sed GREP=grep NM=nm LD=ld
