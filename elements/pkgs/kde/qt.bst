kind: autotools

sources:
  - kind: tar
    url: qt:qt/6.12/6.12.0/single/qt-everywhere-src-6.12.0.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/glib.bst
  - pkgs/libpng.bst

depends:
  - groups/xorg.bst
  - pkgs/wayland.bst

