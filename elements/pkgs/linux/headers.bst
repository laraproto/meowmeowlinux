kind: manual
description: Linux kernel API headers

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/linker.bst
  - bootstrap/stage1/stage1.bst

sources:
  - kind: git_repo
    url: kernel:linux/kernel/git/stable/linux.git
    track: linux-rolling-stable

config:
  build-commands:
    - make mrproper
    - make headers
  install-commands:
    - |
      find usr/include -name '.*' -delete
      rm -v usr/include/Makefile
    - mkdir -pv %{install-root}%{includedir}
    - cp -rv usr/include/* %{install-root}%{includedir}
