kind: autotools

sources:
- kind: git_repo
  url: fdo-git:xorg/lib/libfontenc.git
  track: libfontenc-*

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/libtool.bst
  - pkgs/pkgconf.bst
  - pkgs/zlib.bst

depends:
  - pkgs/xorgproto.bst
  - pkgs/xfontutil.bst
