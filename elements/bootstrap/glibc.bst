kind: autotools

(@):
  - elements/bootstrap/include/common.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst
  - bootstrap/gcc-stage1.bst
  - filename: bootstrap/linux-headers.bst
    config:
      location: "%{sysroot}"

sources:
  - kind: gnu
    name: glibc
  - kind: patch
    path: patches/glibc/glibc-2.44-upstream_fixes-1.patch

variables:
  build-dir: build
  conf-local: >-
    --host=%{triplet}
    --build=$(%{build-root}/scripts/config.guess)
    --disable-nscd
    --enable-kernel=6.6
    --with-headers=%{sysroot}%{includedir}:/tools/include
    libc_cv_slibdir=%{libdir}

  configure: |
    echo slibdir=%{libdir} >configparms
    echo complocaledir=%{libdir}/locale >> configparms
    echo gconvdir=%{libdir}/gconv >> configparms
    echo rootsbindir=%{sbindir} >> configparms
    echo sbindir=%{sbindir} >> configparms

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
      rm -r "%{install-root}%{libexecdir}/getconf"
