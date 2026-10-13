kind: autotools

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: tar
    url: pkgconfig:pkg-config-0.29.2.tar.gz

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/glib.bst

depends:
  - bootstrap/stage1/pcre2.bst

environment:
  GLIB_CFLAGS: "-I/tools/include/glib-2.0 -I/tools/lib/glib-2.0/include"
  GLIB_LIBS: "-L/tools/lib -lglib-2.0"
