kind: meson

sources:
  - kind: git_repo
    url: github:polkit-org/polkit
    track: "*"

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst
  - pkgs/gobject-introspection.bst
  - pkgs/gettext.bst
  - pkgs/glib.bst

depends:
  - pkgs/libxslt.bst
  - pkgs/linux-pam.bst
  - pkgs/systemd.bst
  - pkgs/duktape.bst

variables:
  meson-local: -D man=false -D introspection=false
