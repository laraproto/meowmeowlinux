kind: autotools

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
- pkgs/gmp.bst

build-depends:
- tools/import-fdo.bst
- pkgs/gcc-cross.bst
- pkgs/binutils-cross.bst
- pkgs/binutils.bst
- pkgs/glibc.bst
- pkgs/libstdcxx.bst
- pkgs/linux-api-headers.bst
- tools/sysroot-setup.bst

environment:
  CC: '%{bootstrap-triplet}-gcc'
  CXX: '%{bootstrap-triplet}-g++'
  AR: '%{bootstrap-triplet}-ar'
  RANLIB: '%{bootstrap-triplet}-ranlib'

variables:
  build-dir: build
  conf-local: >-
    --with-local-prefix=%{prefix}
    --with-native-system-header-dir=%{includedir}
    --disable-multilib
    --disable-bootstrap
    --disable-libgomp
    --disable-libstdxx-pch
    --enable-deterministic-archives
    --enable-linker-build-id
    --enable-languages=c,c++

config:
  configure-commands:
    (<):
    - |
      for file in gcc/config/{linux,i386/linux{,64}}.h; do
        cp -v $file{,.orig}
        sed -e 's@/lib\(64\)\?\(32\)\?/ld@%{libdir}/ld@g' \
            -e 's@/usr@%{prefix}@g' $file.orig > $file
        echo '#undef STANDARD_STARTFILE_PREFIX_1' >> $file
        echo '#undef STANDARD_STARTFILE_PREFIX_2' >> $file
        echo '#define STANDARD_STARTFILE_PREFIX_1 "%{libdir}/"' >> $file
        echo '#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
      done
    - sed -e '/m64=/s/lib64/lib/' -i gcc/config/i386/t-linux64
  install-commands:
    (>):
    - ln -sv gcc %{install-root}%{bindir}/cc
