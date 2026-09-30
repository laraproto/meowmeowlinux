kind: manual

build-depends:
  - bootstrap/stage1/fdo.bst:bootstrap/bash.bst
  - bootstrap/stage1/fdo.bst:bootstrap/coreutils.bst
  - bootstrap/stage1/fdo.bst:public-stacks/runtime-minimal.bst

config:
  install-commands:
    - |
      mkdir -pv %{install-root}/usr/lib
      ln -sv usr/lib %{install-root}/lib64
      ln -sv usr/lib %{install-root}/lib

      mkdir -pv %{install-root}/usr/bin
      ln -sv usr/bin %{install-root}/bin
      ln -sv usr/bin %{install-root}/sbin
