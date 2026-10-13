kind: make

(@):
  - elements/bootstrap/common.yml

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
  - bootstrap/stage1/binutils.bst
  - bootstrap/stage1/python.bst
  - bootstrap/stage1/gcc.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/linux-headers.bst
  - bootstrap/stage1/flex.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/sed.bst

depends:
  - bootstrap/stage1/pcre2.bst

variables:
  command-subdir: libsepol

environment:
  USE_PCRE2: y
