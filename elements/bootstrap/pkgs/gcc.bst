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
  - bootstrap/pkgs/gcc-cross.bst
  - bootstrap/pkgs/binutils-cross.bst
  - bootstrap/pkgs/binutils.bst
  - bootstrap/pkgs/glibc.bst
  - bootstrap/pkgs/libstdcxx.bst
  - bootstrap/pkgs/linux-api-headers.bst
  - bootstrap/tools/sysroot-setup.bst

environment:
  CC: '%{bootstrap-triplet}-gcc'
  CXX: '%{bootstrap-triplet}-g++'
  AR: '%{bootstrap-triplet}-ar'
  RANLIB: '%{bootstrap-triplet}-ranlib'

variables:
  conf-local: >-
    --with-local-prefix=%{bootstrap-prefix} --with-native-system-header-dir=%{includedir}
    --disable-multilib --disable-bootstrap --disable-libgomp
    --disable-libstdxx-pch --enable-deterministic-archives
    --enable-linker-build-id --enable-languages=c,c++

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
    - |
      %{autogen}
    - |
      %{configure}
  install-commands:
    - |
      ln -sv gcc %{install-root}%{bindir}/cc

      %{make-install}
      %{delete-libtool-archives}
