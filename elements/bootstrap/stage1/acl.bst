kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: tar
    url: nongnu:acl/acl-2.4.0.tar.xz

build-depends:
  - bootstrap/stage1/base.bst
