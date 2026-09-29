kind: autotools

depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: bash

variables:
  conf-local: |
    --without-bash-malloc

config:
  install-commands:
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      ln -s bash %{install-root}/usr/bin/sh
