kind: meson

sources:
  - kind: tar
    url: xorg:xserver/xwayland-24.1.14.tar.xz

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/mesa.bst
  - pkgs/libtirpc.bst
  - pkgs/libepoxy.bst
  - pkgs/libxcvt.bst
  - pkgs/pixman.bst
  - pkgs/wayland-protocols.bst
  - pkgs/libx11.bst
  - pkgs/xtrans.bst
  - pkgs/libxkbfile.bst
  - pkgs/libxfont.bst
  - pkgs/openssl3.bst
  - pkgs/systemd.bst
  - pkgs/libaudit.bst
