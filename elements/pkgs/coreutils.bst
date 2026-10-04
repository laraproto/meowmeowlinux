kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: gnu
    name: coreutils

build-depends:
  - bootstrap/stage1/help2man.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - bootstrap/stage1/make.bst
  - pkgs/gawk.bst
  - pkgs/zstd.bst # TODO: Runtime dep of gcc
  - pkgs/gcc.bst
  - pkgs/bash.bst

depends:
  - pkgs/libxcrypt.bst
  - pkgs/glibc.bst
  - pkgs/attr.bst

variables:
  conf-local: --without-selinux

environment:
  FORCE_UNSAFE_CONFIGURE: 1
