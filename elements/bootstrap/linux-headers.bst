kind: manual

(@):
  - elements/bootstrap/include/common.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst
  - bootstrap/sysroot.bst

sources:
  - kind: git_tag
    url: kernel:linux/kernel/git/stable/linux.git
    track: linux-rolling-stable

config:
  configure-commands:
    - make mrproper
    - make headers
  install-commands:
    - mkdir -pv %{install-root}%{includedir}
    - cp -rv usr/include/* %{install-root}%{includedir}
