kind: manual

build-depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: git
    url: kernel:linux/kernel/git/stable/linux.git
    track: linux-rolling-stable

config:
  install-commands:
    - |
      make mrproper
      make headers
      find usr/include -type f ! -name '*.h' -delete
      mkdir -pv %{install-root}/usr/
      cp -rv usr/include %{install-root}/usr/include
