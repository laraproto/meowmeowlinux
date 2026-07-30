kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst
  - bootstrap/linux-headers.bst

sources:
  - kind: gnu
    name: glibc
  - kind: patch
    path: patches/glibc/glibc-2.43-upstream_fixes-1.patch

variables:
  conf-args: |
    --prefix=%{install-root}           \
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
      mkdir -pv %{install-root}/%{libdir}
      ln -sv ../lib/ld-linux-x86-64.so.2 %{install-root}/%{libdir}
      ln -sv ../lib/ld-linux-x86-64.so.2 %{install-root}/%{libdir}/ld-lsb-x86-64.so.3
