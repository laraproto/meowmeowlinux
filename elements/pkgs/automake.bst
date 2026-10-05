kind: autotools

sources:
  - kind: gnu
    name: automake

build-depends:
  - groups/autotools.bst
  - pkgs/m4.bst
  - pkgs/autoconf.bst

depends:
  - pkgs/perl.bst
