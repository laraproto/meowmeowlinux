kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libXdmcp-1.1.5.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/libxslt.bst
  - pkgs/rust.bst
  - pkgs/pkgconf.bst
  
depends:
  - pkgs/xorgproto.bst
