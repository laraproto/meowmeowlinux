kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
  - kind: gnu
    name: glibc

build-depends:
  - bootstrap/pkgs/stage1/linux-api-headers.bst
  - bootstrap/pkgs/stage1/gcc.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/tools/sysroot-setup.bst
  - bootstrap/freedesktop-sdk.bst:bootstrap/bash.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet} --build=$(../scripts/config.guess) --enable-kernel=5.10
    --disable-nscd --disable-werror

config:
  configure-commands:
    - |
      mkdir -v %{build-dir}
      cd %{build-dir}
      %{autogen}
      %{configure}
  build-commands:
    - |
      cd %{build-dir}
      %{make}
  install-commands:
    - |
      cd %{build-dir}
      %{make-install}
      %{delete-libtool-archives}
