kind: meson

sources:
  - kind: tar
    url: xorg:proto/xorgproto-2026.1.tar.xz

build-depends:
  - pkgs/libxslt.bst
  - pkgs/meson.bst
  - groups/autotools.bst

depends:
  - pkgs/util-macros.bst

