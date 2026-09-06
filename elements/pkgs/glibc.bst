kind: autotools

sources:
  - kind: git_repo
    url: sourceware:glibc.git
    track: release/2.44/master
  - kind: patch_queue
    path: patches/glibc
  - kind: local
    path: files/ld.so.conf
    directory: meowmeow

depends:
  - pkgs/linux/headers.bst

build-depends:
  - bootstrap/unadjusted.bst

variables:
  build-dir: build
  cflags-fortify-source: ""
  conf-local: >-
    --enable-kernel=5.0.0
    --with-headers=%{includedir}
    --enable-stackguard-randomization
    --enable-stack-protector=strong
    --enable-bind-now
    --enable-cet
    --disable-werror
    --disable-nscd

environment:
  CC: gcc -ffile-prefix-map=/tools=%{prefix}

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
      # Install ld.so.conf
      - cp -v meowmeow/ld.so.conf %{install-root}%{sysconfdir}/ld.so.conf

public:
  bst:
    integration-commands:
      - ldconfig
    split-rules:
      devel:
        (>):
          - "%{libdir}/*.o"
