kind: autotools

sources:
  - kind: tar
    url: xorg:lib/xtrans-1.6.0.tar.xz

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/libxcb.bst
