kind: meson

sources:
  - kind: tar
    url: xorg:data/xkeyboard-config/xkeyboard-config-2.48.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst

depends:
  - pkgs/libx11.bst
