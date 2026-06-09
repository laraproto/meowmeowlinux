kind: manual
description: Linux kernel API headers

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/stable/linux.git
  track: linux-rolling-stable
  ref: ab2671f80c15924d140fab5f11d284504e6e5b7d6500bb7d79c4e4328ab92a57

build-depends:
- bootstrap/unadjusted.bst

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
