kind: meson

sources:
  - kind: git_repo
    url: fdo-git:dbus/dbus
    track: dbus-*

build-depends:
  - groups/autotools.bst
  - pkgs/linux/headers.bst
  - pkgs/glib.bst
  - pkgs/systemd.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst
