kind: meson

sources:
  - kind: tar
    url: xorg:xserver/xwayland-24.1.14.tar.xz

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst

depends:
  - pkgs/mesa.bst
  - pkgs/libtirpc.bst
  - pkgs/libepoxy.bst
