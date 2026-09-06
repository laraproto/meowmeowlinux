kind: autotools

(@):
  - elements/bootstrap/include/autotools-build.yml
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst
  - bootstrap/sysroot.bst

sources:
  - kind: gnu
    name: binutils

variables:
  conf-local: |
    --prefix=%{bootstrap-prefix}           \
    --with-sysroot=%{bootstrap-sysroot}    \
    --target=%{triplet}                    \
    --disable-nls                          \
    --enable-gprofng=no                    \
    --disable-werror                       \
    --enable-new-dtags                     \
    --enable-default-hash-style=gnu

config:
  install-commands:
    (>):
    - ln -sv lib %{install-root}%{prefix}/lib64
    - rm -rf %{install-root}%{datadir}/info
    - rm -rf %{install-root}%{libdir}/bfd-plugins
