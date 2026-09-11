kind: autotools

(@):
  - elements/bootstrap/include/sysroot.yml
  - elements/bootstrap/include/common.yml

sources:
  - kind: gnu
    name: bash

build-depends:
  - filename:
      - bootstrap/linux-headers.bst
      - bootstrap/glibc.bst
      - bootstrap/m4.bst
    config:
      location: "%{sysroot}"
  - bootstrap/base.bst
  - bootstrap/libstdcxx.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet}
    --build=$(%{build-root}/build-aux/config.guess)
    --without-bash-malloc
    --docdir=/usr/share/doc/bash-5.3

config:
  install-commands:
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      mkdir -pv %{install-root}/bin
      ln -sv bash %{install-root}/bin/sh
