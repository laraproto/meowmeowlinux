kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/common.yml

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
  build-dir: build
  conf-local: |
    --host=%{triplet}                   \
    --build=$(../scripts/config.guess)  \
    --disable-nscd                      \
    --enable-kernel=6.6                 \
    --with-headers=/usr/include         \
    libc_cv_slibdir=/usr/lib

  configure: |
    echo "rootsbindir=/usr/bin" > configparms
    mkdir -pv build
    cd build

    %{conf-cmd} %{conf-args}

config:
  install-commands:
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      mkdir -pv %{install-root}/%{libdir}
      ln -sv ../lib/ld-linux-x86-64.so.2 %{install-root}/%{libdir} | true
      ln -sv ../lib/ld-linux-x86-64.so.2 %{install-root}/%{libdir}/ld-lsb-x86-64.so.3 | true
    - |
      mv -v %{install-root}/usr/sbin/* %{install-root}/usr/bin/
      rmdir %{install-root}/usr/sbin
