kind: autotools

sources:
  - kind: git_repo
    url: xiph:ogg
    track: v*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/libtool.bst
  - pkgs/opus.bst

