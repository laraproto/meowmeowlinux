kind: autotools

sources:
  - kind: tar
    url: sourceforge-dl:freetype/freetype-2.14.3.tar.xz

depends:
  - pkgs/libpng.bst
  - pkgs/brotli.bst
  - pkgs/librsvg.bst

runtime-depends:
  - pkgs/harfbuzz.bst

variables:
  conf-local: --with-harfbuzz=dynamic
