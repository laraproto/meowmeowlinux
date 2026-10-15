kind: manual

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
  # - pkgs/gstreamer.bst

config:
  configure-commands:
    - |
      ./configure -prefix %{prefix} -no-sbom -no-rpath -openssl-linked -dbus-linked -nomake examples
  build-commands:
    - |
      ninja
  install-commands:
    - |
      DESTDIR=%{install-root} ninja install
