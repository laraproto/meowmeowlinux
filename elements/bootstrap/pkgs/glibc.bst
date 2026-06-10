kind: autotools

sources:
  - kind: gnu
    name: glibc

build-depends:
  - bootstrap/tools/import-fdo.bst
  - bootstrap/pkgs/gcc-cross.bst
  - bootstrap/pkgs/binutils-cross.bst
  - bootstrap/pkgs/linux-api-headers.bst
  - bootstrap/tools/sysroot-setup.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{bootstrap-triplet} --build=$(../scripts/config.guess)
    --enable-kernel=5.4 --disable-nscd --disable-werror --enable-crypt  
  conf-root: ..

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
