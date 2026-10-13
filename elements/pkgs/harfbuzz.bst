kind: meson

sources:
  - kind: git_repo
    url: github:harfbuzz/harfbuzz
    track: 14.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/git.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/freetype2.bst
  - pkgs/glib.bst
  - pkgs/graphite2.bst
  - pkgs/icu.bst
  - pkgs/cairo.bst

variables:
  meson-local: >-
    -D graphite2=enabled
    -D docs=disabled
