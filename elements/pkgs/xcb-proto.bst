kind: autotools

sources:
  - kind: tar
    url: xorg:proto/xcb-proto-1.17.0.tar.xz

build-depends:
  - pkgs/libxml2.bst
  - groups/autotools.bst

depends:
  - pkgs/python.bst
