kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst
  - bootstrap/linux-headers.bst
  - bootstrap/fdo.bst:components/bison.bst
  - bootstrap/fdo.bst:components/python3.bst

sources:
  - kind: gnu
    name: glibc

variables:
  conf-args: |
    --prefix=%{bootstrap}              \
    --host=${triplet}                  \
    --build=$(../scripts/config.guess) \
    --disable-nscd                     \
    --enable-kernel=6.6

config:
  install-commands:
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      mkdir -pv %{install-root}/%{bootstrap}/lib64
      ln -sv ld-linux-x86-64.so.2 %{install-root}/%{bootstrap}/lib/ld-lsb-x86-64.so.3
