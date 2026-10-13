kind: meson

sources:
  - kind: git_repo
    url: fdo-git:cairo/cairo
    track: 1.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/harfbuzz-stage1.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libpng.bst
  - pkgs/pixman.bst
  - pkgs/glib.bst
  - pkgs/fontconfig.bst

variables:
  meson-local: >-
    -D xlib-xcb=enabled # TODO: Unsure of deps. Waiting until things break.
