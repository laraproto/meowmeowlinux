kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: tar
    url: pkgconfig:pkg-config-0.29.2.tar.gz

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/fdo.bst:components/glib.bst
