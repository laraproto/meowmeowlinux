kind: autotools

sources:
  - kind: tar
    url: sourceforge-dl:libtirpc/libtirpc-1.3.8.tar.bz2

variables:
  conf-local: --disable-static --disable-gssapi
