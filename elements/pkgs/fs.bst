kind: manual

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/ncurses.bst
  - bootstrap/stage1/glibc.bst

config:
  install-commands:
    - |
      mkdir -pv %{install-root}/usr/bin
      mkdir -pv %{install-root}/usr/lib
      ln -sv usr/bin %{install-root}/bin
      ln -sv usr/bin %{install-root}/sbin
      ln -sv bin %{install-root}/usr/sbin
      ln -sv usr/lib %{install-root}/lib
      ln -sv usr/lib %{install-root}/lib64
      ln -sv lib %{install-root}/usr/lib64
