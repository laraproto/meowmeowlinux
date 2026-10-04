kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: gnu
    name: glibc
  - kind: patch_queue
    path: patches/glibc

build-depends:
  - pkgs/python.bst
  - bootstrap/stage1/bison.bst
  - bootstrap/stage1/independent.bst
  - bootstrap/linker.bst
  - bootstrap/stage1/gzip.bst

depends:
  - pkgs/linux/headers.bst

variables:
  cflags-fortify-source: ""
  conf-local: >-
    --enable-kernel=7.0
    --with-headers=%{includedir}
    --enable-stackguard-randomization
    --enable-stack-protector=strong
    --enable-bind-now
    --enable-cet
    --disable-werror
    --disable-nscd

config:
  configure-commands:
    (<):
      - | # Don't override the RTLDLIST in ldd; always use the dynamic linker we're about to install
        for file in sysdeps/unix/sysv/linux/{x86_64,riscv}/ldd-rewrite.sed; do
          sed -i '/RTLDLIST/d' $file
        done
      - |
        mkdir -p %{build-dir}
        echo slibdir=%{libdir} > %{build-dir}/configparms
        echo complocaledir=%{libdir}/locale >> %{build-dir}/configparms
        echo gconvdir=%{libdir}/gconv >> %{build-dir}/configparms
        echo rootsbindir=%{sbindir} >>%{build-dir}/configparms
        echo sbindir=%{sbindir} >> %{build-dir}/configparms
        echo rtlddir=%{libdir} >> %{build-dir}/configparms
  install-commands:
    (>):
      # Install system locales
      - make -C build DESTDIR="%{install-root}" localedata/install-locales
      # Remove ld cache
      - rm -v %{install-root}%{sysconfdir}/ld.so.cache
      # Remove timezone commands provided by tzdata
      - rm -v %{install-root}%{bindir}/{tzselect,zdump,zic}

public:
  bst:
    integration-commands:
      - ldconfig
    split-rules:
      devel:
        (>):
          - "%{libdir}/*.o"
