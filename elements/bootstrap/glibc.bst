kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst
  - bootstrap/fdo.bst:components/bison.bst
  - bootstrap/fdo.bst:components/python3.bst

sources:
  - kind: gnu
    name: glibc

variables:
  conf-args: |
    --prefix=/usr                      \
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
      ln -sv ld-linux-x86-64.so.2 %{install-root}/lib64/ld-lsb-x86-64.so.3
