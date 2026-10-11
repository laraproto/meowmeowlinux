kind: meson

sources:
  - kind: git_repo
    url: github:harfbuzz/harfbuzz
    track: 14.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst

depends:
  - pkgs/freetype2.bst
  - pkgs/glib.bst
  - pkgs/icu.bst

variables:
  meson-local: -D docs=disabled
