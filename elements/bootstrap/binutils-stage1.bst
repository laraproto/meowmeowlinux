kind: autotools

(@):
  - elements/bootstrap/include/cross.yml

build-depends:
  - bootstrap/base.bst

sources:
  - kind: gnu
    name: binutils

variables:
  conf-local: >-
    --with-sysroot=%{sysroot}
    --target=%{triplet}
    --disable-nls
    --enable-gprofng=no
    --disable-werror
    --enable-new-dtags
    --enable-default-hash-style=gnu

config:
  install-commands:
    (>):
    - ln -sv lib %{install-root}%{prefix}/lib64
    - rm -rf %{install-root}%{datadir}/info
    - rm -rf %{install-root}%{libdir}/bfd-plugins
