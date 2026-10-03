kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
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
      mkdir %{install-root}/bin
      ln -s /tools/bin/bash %{install-root}/bin/sh
      ln -s /tools/bin/bash %{install-root}/bin/bash
      ln -s bash %{install-root}/tools/bin/sh
