kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libXrandr-1.5.5.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libx11.bst
  - pkgs/libxrender.bst
  - pkgs/libxent.bst
