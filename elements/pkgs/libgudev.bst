kind: meson

sources:
  - kind: git_repo
    url: gnome-git:GNOME/libgudev
    track: "*"

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/glib.bst
  - pkgs/systemd.bst
