kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: tar
    url: nongnu:attr/attr-2.6.0.tar.xz

build-depends:
  - bootstrap/stage1/stage1.bst
  - pkgs/gcc.bst
  - pkgs/glibc.bst
  - pkgs/bash.bst

config:
  install-commands:
    (>):
      - rm %{install-root}/etc/xattr.conf
