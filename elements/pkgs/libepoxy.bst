kind: meson

sources:
  - kind: tar
    url: gnome-dl:libepoxy/1.5/libepoxy-1.5.10.tar.xz

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst

depends:
  - pkgs/mesa.bst
