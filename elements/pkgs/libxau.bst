kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libXau-1.0.12.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/xorgproto.bst
