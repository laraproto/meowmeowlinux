kind: autotools

(@):
  - elements/bootstrap/include/autotools-fix.yml

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
  - bootstrap/tools/import-fdo.bst
  - bootstrap/pkgs/binutils-cross.bst
  - bootstrap/tools/sysroot-setup.bst

variables:
  conf-local: >-
    --target=%{bootstrap-triplet} --with-sysroot=%{bootstrap-sysroot}
    --with-glibc-version=2.43 --with-newlib --without-headers
    --enable-default-pie --enable-default-ssp --with-local-prefix=%{bootstrap-prefix}
    --with-native-system-header-dir=%{includedir} --disable-nls --disable-shared
    --disable-multilib --disable-threads --disable-libatomic --disable-libgomp
    --disable-libquadmath --disable-libssp --disable-libvtv --disable-libstdcxx
    --enable-deterministic-archives --enable-linker-build-id
    --enable-languages=c,c++

config:
  # See: http://www.linuxfromscratch.org/lfs/view/stable-systemd/chapter05/gcc-pass1.html
  # I changed the first sed command to always point the dynamic linker to %{libdir}/ld-linux-...
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
