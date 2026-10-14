kind: autotools

sources:
  - kind: git_repo
    url: kernel:linux/kernel/git/xiang/erofs-utils.git
    track: v*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/findutils.bst
  - pkgs/pkgconf.bst
  - pkgs/openssl3.bst
  - pkgs/zstd.bst
  - pkgs/zlib.bst
  - pkgs/xz.bst
  - pkgs/util-linux.bst
  - pkgs/libtool.bst

depends:
  - pkgs/curl.bst
  - pkgs/lz4.bst
  - pkgs/libunistring.bst
  - pkgs/libidn2.bst

variables:
  conf-local: >-
    --enable-lzma
    --enable-multithreading

config:
  configure-commands:
    (>):
      - |
        automake --add-missing
