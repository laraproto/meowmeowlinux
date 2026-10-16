kind: autotools

sources:
  - kind: tar
    url: jedsoft:slang/slang-2.3.3.tar.bz2

build-depends:
  - groups/autotools.bst

variables:
  conf-local: --with-readline=gnu
  make-args: RPATH=
  build-dir: '.'
