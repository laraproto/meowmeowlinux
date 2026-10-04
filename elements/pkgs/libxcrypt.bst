kind: autotools

(@):
  - elements/bootstrap/use.yml

build-depends:
  - pkgs/bash.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/ncurses.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - bootstrap/stage1/perl.bst
  - pkgs/glibc.bst
  - pkgs/gcc.bst
  - pkgs/zstd.bst
  - pkgs/gawk.bst

sources:
  - kind: tar
    url: github:besser82/libxcrypt/releases/download/v4.5.2/libxcrypt-4.5.2.tar.xz

variables:
  conf-local: --enable-hashes=strong,glibc --enable-obsolete-api=no --disable-failure-tokens

config:
  configure-commands:
    (<):
      - |
        sed -i '/strchr/s/const//' lib/crypt-{sm3,gost}-yescrypt.c
