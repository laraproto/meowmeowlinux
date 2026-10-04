kind: manual

build-depends:
  - bootstrap/stage1/independent.bst

environment:
  PATH: "/usr/bin:/tools/bin"
  LD_LIBRARY_PATH: "/usr/lib:/tools/lib"

config:
  install-commands:
    - mkdir -pv %{install-root}/lib64
    - ln -sv /tools/lib/ld-linux-x86-64.so.2 %{install-root}/lib64/ld-linux-x86-64.so.2
