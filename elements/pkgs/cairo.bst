kind: meson

build-depends:
  - pkgs/harfbuzz-stage1.bst
  - pkgs/gtk-doc.bst

depends:
  - pkgs/libpng.bst
  - pkgs/pixman.bst
  - pkgs/glib.bst
  - pkgs/fontconfig.bst

variables:
  meson-local: >-
    -D gtk_doc=true
    -D xlib-xcb=enabled # TODO: Unsure of deps. Waiting until things break.
