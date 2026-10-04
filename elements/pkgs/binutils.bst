kind: autotools

(@):
  - elements/bootstrap/use.yml

depends:
  - pkgs/glibc.bst
  - pkgs/zlib.bst
  - bootstrap/stage1/gzip.bst

sources:
  - kind: gnu
    name: binutils

variables:
  conf-local: >-
    --enable-gprofng
    --enable-new-dtags
    --enable-default-hash-style=gnu
    --enable-deterministic-archives
    --enable-shared
    --with-pic
    --with-system-zlib
    --enable-plugins
    --enable-threads
    --enable-gold

config:
  install-commands:
    (>):
      - |
        rm %{install-root}/usr/share/info/dir
