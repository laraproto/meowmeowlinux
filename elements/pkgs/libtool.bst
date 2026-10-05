kind: autotools

build-depends:
  - groups/minimum.bst
  - pkgs/m4.bst
  - groups/autotools.bst
  - pkgs/gmp.bst

sources:
  - kind: gnu
    name: libtool
