kind: manual
description: Linux kernel headers

(@):
  - elements/bootstrap/include/common.yml

sources:
  - kind: git_tag
    url: kernel:linux/kernel/git/stable/linux.git
    track: linux-rolling-stable
# skip-release-monitoring

build-depends:
  - bootstrap/freedesktop-sdk.bst:bootstrap/build/rsync.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/pkgs/stage1/gcc.bst

config:
  configure-commands:
    - make mrproper
    - make headers
  install-commands:
    - mkdir -pv %{install-root}%{includedir}
    - cp -rv usr/include/* %{install-root}%{includedir}

public:
  bst:
    overlap-whitelist:
      - bootstrap/freedesktop-sdk.bst:bootstrap/linux-headers.bst
