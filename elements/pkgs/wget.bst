kind: autotools

sources:
  - kind: gnu
    name: wget

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/zlib.bst
  - pkgs/libpsl.bst
  - pkgs/openssl3.bst

variables:
  conf-local: >-
    --with-ssl=openssl
    ac_cv_func_posix_spawn_file_actions_addchdir=yes
