kind: autotools

(@):
  - elements/bootstrap/use.yml

depends:
  - pkgs/glibc.bst
  - pkgs/binutils.bst
  - pkgs/zlib.bst
  - pkgs/gmp.bst
  - pkgs/mpfr.bst
  - pkgs/mpc.bst
  - pkgs/fs.bst

runtime-depends:
  - pkgs/zstd.bst

sources:
  - kind: gnu
    name: gcc

variables:
  conf-local: >-
    --disable-multilib
    --disable-bootstrap
    --disable-libssp
    --enable-default-pie
    --enable-default-ssp
    --enable-linker-build-id
    --enable-shared
    --enable-languages=c,c++
    --with-system-zlib
    --disable-fixincludes

config:
  configure-commands:
    (<):
      - |
        sed -e '/m64=/s/lib64/lib/' \
          -i.orig gcc/config/i386/t-linux64
        mkdir -p %{install-root}/usr
        ln -sv lib %{install-root}/usr/lib64

  install-commands:
    (>):
      - |
        mkdir -pv %{install-root}/usr/bin
        mkdir -pv %{install-root}/usr/lib/bfd-plugins
        ln -sv gcc %{install-root}/usr/bin/cc
        ln -sv /usr/bin/cpp %{install-root}/usr/lib/cpp # FHS
        ln -sv $(gcc -print-prog-name=liblto_plugin.so) %{install-root}/usr/lib/bfd-plugins/
      - |
        rm %{install-root}/usr/share/info/dir
      - |
        rm %{install-root}/usr/lib64
