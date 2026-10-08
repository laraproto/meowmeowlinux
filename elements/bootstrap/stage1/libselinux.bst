kind: make

(@):
  - elements/bootstrap/stage1/common.yml

sources:
- kind: git_repo
  url: github:SELinuxProject/selinux.git
  track: libselinux-*
  exclude:
  - '*rc*'

build-depends:
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/grep.bst
  - bootstrap/stage1/python.bst
  - bootstrap/stage1/gcc.bst
  - bootstrap/stage1/binutils.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/linux-headers.bst
  - bootstrap/stage1/flex.bst
  - bootstrap/stage1/sed.bst

depends:
  - bootstrap/stage1/pcre2.bst
  - bootstrap/stage1/libsepol.bst

variables:
  command-subdir: libselinux

environment:
  USE_PCRE2: y
  PCRE_
