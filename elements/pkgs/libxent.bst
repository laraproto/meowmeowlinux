kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libXext-1.3.7.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libx11.bst
  - pkgs/xorgproto.bst
