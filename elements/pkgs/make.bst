kind: autotools

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/glibc.bst
  - pkgs/gcc.bst
  - pkgs/bash.bst
  - pkgs/coreutils.bst
  - pkgs/sed.bst
  - pkgs/grep.bst
  - pkgs/gawk.bst

sources:
  - kind: gnu
    name: make
