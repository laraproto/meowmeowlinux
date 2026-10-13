kind: meson

sources:
  - kind: git_repo
    url: gnome-git:GNOME/gtk-doc
    track: 1.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst
  - pkgs/libtool.bst
  - pkgs/gettext.bst
  - pkgs/glib.bst

depends:
  - pkgs/python-parameterized.bst
  - pkgs/python-pygments.bst
  - pkgs/libxslt.bst
  - pkgs/itstool.bst
