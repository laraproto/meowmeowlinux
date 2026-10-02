kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: tar
    url: nongnu:attr/attr-2.6.0.tar.xz

build-depends:
  - bootstrap/stage1/base.bst

config:
  install-commands:
    (>):
      - rm %{install-root}/etc/xattr.conf
