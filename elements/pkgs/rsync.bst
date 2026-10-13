kind: autotools

sources:
  - kind: git_repo
    url: github:rsyncproject/rsync
    track: v*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/m4.bst
  - pkgs/python/cmark-gfm.bst

depends:
  - pkgs/acl.bst
  - pkgs/attr.bst
  - pkgs/zstd.bst
  - pkgs/lz4.bst
  - pkgs/acl.bst
  - pkgs/openssl3.bst
  - pkgs/libidn2.bst
  - pkgs/python.bst
  - pkgs/xxhash.bst

variables:
  conf-local: --disable-md2man
