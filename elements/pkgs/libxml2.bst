kind: meson

sources:
  - kind: tar
    url: gnome-dl:libxml2/2.15/libxml2-2.15.4.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst
  - pkgs/meson.bst
  - pkgs/doxygen.bst

depends:
  - pkgs/icu.bst

config:
  configure-commands:
    (<):
      - |
        sed -i "/'git'/,+3d" meson.build

variables:
  meson-local: >-
    -D python=enabled 
    -D history=disabled # TODO
    -D icu=disabled # TODO
    -D docs=disabled
