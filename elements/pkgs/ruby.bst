kind: autotools

sources:
  - kind: tar
    url: ruby:ruby/4.0/ruby-4.0.7.tar.gz

build-depends:
  - groups/autotools.bst
  - pkgs/m4.bst
  - pkgs/rust.bst
  - pkgs/gmp.bst

depends:
  - pkgs/libyaml.bst
  - pkgs/zlib.bst
  - pkgs/libffi.bst
  - pkgs/openssl3.bst

variables:
  conf-local: >-
    --enable-pthread
    --enable-ipv6
    --with-compress-debug-sections=no
    --disable-rpath
