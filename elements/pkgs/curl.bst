kind: autotools

sources:
  - kind: git_repo
    url: github:curl/curl
    track: curl-*_*_*

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/libtool.bst
  - pkgs/openssl3.bst

depends:
  - pkgs/libpsl.bst

variables:
  conf-local: --with-openssl
