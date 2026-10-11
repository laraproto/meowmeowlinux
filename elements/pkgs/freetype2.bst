kind: autotools
description: |
  Don't depend on this, instead, depend on pkgs/harfbuzz, which includes this as a dependency.

sources:
  - kind: tar
    url: sourceforge-dl:freetype/freetype-2.14.3.tar.xz

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/libpng.bst
  - pkgs/brotli.bst
  #  - pkgs/librsvg.bst

variables:
  conf-local: --with-harfbuzz=dynamic
