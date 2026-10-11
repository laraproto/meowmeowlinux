kind: autotools

sources:
  - kind: tar
    url: gnome-dl:libxml2/2.15/libxml2-2.15.4.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst

config:
  configure-commands:
    (<):
      - |
        sed -i "/'git'/,+3d" meson.build
