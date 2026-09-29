kind: autotools

build-depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: glibc
  - kind: patch
    path: patches/glibc/glibc-2.44-upstream_fixes-1.patch

variables:
  build-dir: build
  conf-local: >-
    --disable-nscd
    --enable-kernel=6.6
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
