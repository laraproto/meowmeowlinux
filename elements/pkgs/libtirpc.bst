kind: autotools

sources:
  - kind: tar
    url: sourceforge-dl:libtirpc/libtirpc-1.3.8.tar.bz2

build-depends:
  - groups/autotools.bst

variables:
  conf-local: --disable-static --disable-gssapi
