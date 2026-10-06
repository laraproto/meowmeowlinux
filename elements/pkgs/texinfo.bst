kind: autotools

sources:
  - kind: gnu
    name: texinfo

build-depends:
  - groups/autotools.bst
  - pkgs/perl.bst
  - pkgs/libunistring.bst
  - pkgs/gmp.bst
