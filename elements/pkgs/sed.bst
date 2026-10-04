kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: gnu
    name: sed

build-depends:
  - bootstrap/stage1/help2man.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - pkgs/gawk.bst
  - pkgs/gcc.bst
  - pkgs/bash.bst

depends:
  - pkgs/attr.bst

variables:
  conf-local: --without-selinux
