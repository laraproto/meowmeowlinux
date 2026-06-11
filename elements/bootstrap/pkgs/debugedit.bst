kind: autotools

sources:
- kind: git_tag
  url: sourceware:debugedit.git
  track: main

depends:
- bootstrap/pkgs/stage1/glibc.bst
- bootstrap/pkgs/elfutils.bst

(@):
  - elements/bootstrap/include/common.yml

runtime-depends:
- bootstrap/pkgs/dwz.bst
- bootstrap/pkgs/cpio.bst # Needed to copy sources into /usr/src
- bootstrap/pkgs/xz.bst # Needed for minidebuginfo
- bootstrap/pkgs/gdb.bst # Needed for gdb-add-index

build-depends:
- bootstrap/pkgs/help2man.bst
- bootstrap/tools/toolchain.bst
