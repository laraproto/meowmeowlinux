kind: autotools

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
  - kind: gnu
    name: glibc
  - kind: patch_queue
    path: patches/glibc

build-depends:
  - bootstrap/pkgs/stage1/linux-api-headers.bst
  - bootstrap/pkgs/stage1/gcc.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/tools/sysroot-setup.bst
  - bootstrap/tools/import-fdo.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet} --build=$(../scripts/config.guess) --enable-kernel=5.10
    --disable-nscd --disable-werror

config:
  configure-commands:
    - |
      %{autogen}
    - |
      %{configure}
  build-commands:
    - |
      %{make}
  install-commands:
    - |
      %{make-install}
      %{delete-libtool-archives}
