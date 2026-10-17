kind: cmake

sources:
  - kind: tar
    url: qt:qt/6.12/6.12.0/single/qt-everywhere-src-6.12.0.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst
  - pkgs/glib.bst
  - pkgs/libpng.bst

depends:
  - groups/xorg.bst
  - pkgs/wayland.bst
  - pkgs/openssl3.bst
  - pkgs/dbus-broker.bst
  - pkgs/mesa.bst
  - pkgs/wayland.bst
  - pkgs/alsa-lib.bst
  - pkgs/systemd.bst

variables:
  cmake-local: >-
    -D FEATURE_openssl_linked=ON
