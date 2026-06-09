kind: manual
description: Linux kernel headers

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/stable/linux.git
  track: linux-rolling-stable
# skip-release-monitoring

build-depends:
- tools/import-fdo.bst
- pkgs/binutils-cross.bst
- pkgs/gcc-cross.bst

config:
  configure-commands:
  - make mrproper
  - make headers
  install-commands:
  - mkdir -pv %{install-root}%{includedir}
  - cp -rv usr/include/* %{install-root}%{includedir}
