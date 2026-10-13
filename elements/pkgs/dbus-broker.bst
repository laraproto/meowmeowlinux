kind: meson

sources:
  - kind: git_repo
    url: github:bus1/dbus-broker
    track: v*
    exclude:
      - "*-*"

build-depends:
  - groups/autotools.bst
  - pkgs/linux/headers.bst
  - pkgs/python/docutils.bst
  - pkgs/dbus.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst
  - pkgs/rust.bst
  - pkgs/rust-bindgen.bst

depends:
  - pkgs/systemd.bst
  - pkgs/libcdvar.bst
  - pkgs/libaudit.bst
  - pkgs/libcap-ng.bst
  - pkgs/libcini.bst
  - pkgs/libcshquote.bst
  - pkgs/expat.bst
