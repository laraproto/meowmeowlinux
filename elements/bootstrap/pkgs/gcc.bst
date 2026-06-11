kind: autotools

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
  - kind: gnu
    name: gcc
  - kind: gnu
    name: mpfr
    directory: mpfr
  - kind: gnu
    name: mpc
    directory: mpc

depends:
  - bootstrap/pkgs/gmp.bst

build-depends:
  - bootstrap/tools/import-fdo.bst
  - bootstrap/pkgs/stage1/gcc.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/pkgs/binutils.bst
  - bootstrap/pkgs/glibc.bst
  - bootstrap/pkgs/libstdcxx.bst
  - bootstrap/pkgs/linux-headers.bst
  - bootstrap/tools/sysroot-setup.bst

environment:
  CC: '%{triplet}-gcc'
  CXX: '%{triplet}-g++'
  AR: '%{triplet}-ar'
  RANLIB: '%{triplet}-ranlib'

variables:
  build-dir: build
  conf-local: >-
    --with-local-prefix=%{prefix}
    --with-native-system-header-dir=%{includedir}
    --build=$(../scripts/config.guess)
    --disable-multilib
    --disable-bootstrap
    --disable-libgomp
    --disable-libstdxx-pch
    --disable-libsanitizer
    --enable-deterministic-archives
    --enable-linker-build-id
    --enable-languages=c,c++
    LDFLAGS_FOR_TARGET=-L$PWD/%{triplet}/libgcc

config:
  configure-commands:
    - |
      for file in gcc/config/{linux,i386/linux{,64}}.h; do
        cp -v $file{,.orig}
        sed -e 's@/lib\(64\)\?\(32\)\?/ld@%{libdir}/ld@g' \
            -e 's@/usr@%{bootstrap-prefix}@g' $file.orig > $file
        echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $file
        echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $file
        echo '#define STANDARD_STARTFILE_PREFIX_1 "%{libdir}/"' >> $file
        echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
      done
    - sed -e '/m64=/s/lib64/lib/' -i gcc/config/i386/t-linux64
    - sed '24 s/memory/memory.h/' -i libcody/cody.hh
    - sed '25 s/string/string.h/' -i libcody/cody.hh
    - sed '28 s/cstddef/cstddef.h/' -i libcody/cody.hh
    - |
      %{autogen}
    - |
      %{configure}
  install-commands:
    - |
      ln -sv gcc %{install-root}/usr/bin/cc

      %{make-install}
      %{delete-libtool-archives}
