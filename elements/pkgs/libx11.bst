kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libX11-1.8.13.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/util-macros.bst
  - pkgs/findutils.bst
  - pkgs/diffutils.bst
  - pkgs/perl.bst

depends:
  - pkgs/xorgproto.bst
  - pkgs/libxcb.bst
  - pkgs/xtrans.bst
  - pkgs/glibc.bst
