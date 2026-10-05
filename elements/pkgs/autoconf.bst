kind: autotools

sources:
  - kind: gnu
    name: autoconf

build-depends:
  - pkgs/gcc.bst
  - pkgs/bash.bst
  - pkgs/coreutils.bst
  - pkgs/sed.bst
  - pkgs/grep.bst
  - pkgs/gawk.bst
  - pkgs/m4.bst
  - pkgs/make.bst

depends:
  - pkgs/perl.bst
