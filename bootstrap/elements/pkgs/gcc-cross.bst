kind: autotools

sources:
- kind: gnu
  name: gcc
- kind: gnu
  name: gmp
  directory: gmp
- kind: gnu
  name: mpfr
  directory: mpfr
- kind: gnu
  name: mpc
  directory: mpc

build-depends:
- tools/import-fdo.bst
- pkgs/binutils-cross.bst
- tools/sysroot-setup.bst

variables:
  build-dir: build
  conf-local: >-
    --target=%{bootstrap-triplet}
    --with-sysroot=%{bootstrap-sysroot}
    --with-glibc-version=2.11
    --with-newlib
    --without-headers
    --with-local-prefix=%{prefix}
    --with-native-system-header-dir=%{includedir}
    --disable-nls
    --disable-shared
    --disable-multilib
    --disable-decimal-float
    --disable-threads
    --disable-libatomic
    --disable-libgomp
    --disable-libmpx
    --disable-libquadmath
    --disable-libssp
    --disable-libvtv
    --disable-libstdcxx
    --enable-deterministic-archives
    --enable-linker-build-id
    --enable-languages=c,c++

config:
  # See: http://www.linuxfromscratch.org/lfs/view/stable-systemd/chapter05/gcc-pass1.html
  # I changed the first sed command to always point the dynamic linker to %{libdir}/ld-linux-...
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
