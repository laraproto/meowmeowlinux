kind: autotools

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
  - kind: gnu
    name: glibc
  - kind: patch_queue
    path: patches/glibc

build-depends:
  - filename: bootstrap/pkgs/linux-headers.bst
    config:
      location: "%{bootstrap-sysroot}"
  - bootstrap/pkgs/stage1/gcc.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/tools/import-fdo.bst
  - bootstrap/tools/sysroot-setup.bst

runtime-depends:
  - bootstrap/pkgs/linux-headers.bst

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet} --prefix=/usr --build=$(../scripts/config.guess) --enable-kernel=5.10
    --disable-nscd --disable-werror --enable-crypt --with-headers=%{bootstrap-sysroot}%{includedir}

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
