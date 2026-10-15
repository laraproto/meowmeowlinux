kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libxshmfence-1.3.3.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/m4.bst
  - pkgs/libtool.bst
  - pkgs/pkgconf.bst
  - pkgs/util-macros.bst

depends:
  - pkgs/xorgproto.bst
