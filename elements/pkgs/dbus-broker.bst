kind: meson

sources:
  - kind: git_repo
    url: github:bus1/dbus-broker
    track: v*
    exclude:
      - "*-*"

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst
  - pkgs/rust.bst
  - pkgs/rust
