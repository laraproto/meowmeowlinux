kind: meson

sources:
  - kind: tar
    url: gnome-dl:gobject-introspection/1.86/gobject-introspection-1.86.0.tar.xz

build-depends:
  - groups/autotools.bst
  - groups/python.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst
  - pkgs/flex.bst
  - pkgs/bison.bst
  - pkgs/glib.bst

depends:
  - pkgs/libxslt.bst
  - pkgs/python/setuptools.bst
