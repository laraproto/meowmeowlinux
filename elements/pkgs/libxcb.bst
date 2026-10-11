kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libxcb-1.17.0.tar.xz

build-depends:
  - pkgs/libxslt.bst
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libxau.bst
  - pkgs/xcb-proto.bst
  - pkgs/libxdmcp.bst

variables:
  conf-local: --without-doxygen
