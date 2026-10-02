kind: manual

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/fdo.bst:public-stacks/buildsystem-autotools.bst
  - bootstrap/stage1/fdo.bst:components/bison.bst
  - bootstrap/stage1/fdo.bst:components/python3.bst

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
      mkdir -pv %{install-root}/tools
      cp -rv usr/include %{install-root}/tools/include
