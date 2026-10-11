kind: stack

environment:
  PATH: "/usr/bin:/tools/bin"
  LD_LIBRARY_PATH: "/usr/lib:/tools/lib"

depends:
  - pkgs/linux/kernel.bst
  - pkgs/initramfs.bst
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/ncurses.bst
  - bootstrap/stage1/glibc.bst
