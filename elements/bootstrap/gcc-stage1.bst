kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/common.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/binutils-stage1.bst

sources:
  - kind: gnu
    name: gcc
  - kind: gnu
    name: mpfr
    directory: mpfr
  - kind: gnu
    name: mpc
    directory: mpc
  - kind: gnu
    name: gmp
    directory: gmp

variables:
  build-dir: build
  conf-local: >-
    --with-sysroot=%{bootstrap-sysroot}
    --with-local-prefix=%{bootstrap-prefix}
    --with-native-system-header-dir=%{includedir}
    --target=%{triplet}
    --with-glibc-version=2.44
    --with-newlib
    --without-headers
    --disable-bootstrap
    --enable-default-pie
    --enable-default-ssp
    --disable-fixincludes
    --disable-nls
    --disable-shared
    --disable-multilib
    --disable-threads
    --disable-libatomic
    --disable-libgomp
    --disable-libquadmath
    --disable-libssp
    --disable-libvtv
    --disable-libstdcxx
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
    - |
      %{make-install}
    - |
      %{delete-libtool-archives}
    - |
      cat ./gcc/{limitx,glimits,limity}.h > %{install-root}/$(%{triplet}-gcc -print-file-name=include)/limits.h
