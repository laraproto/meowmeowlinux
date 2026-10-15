kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libXrender-0.9.12.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libx11.bst
