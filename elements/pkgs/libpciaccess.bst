kind: meson

sources:
  - kind: tar
    url: xorg:lib/libpciaccess-0.19.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst
  - pkgs/meson.bst
