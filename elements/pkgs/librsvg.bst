kind: meson

sources:
  - kind: git_repo
    url: gnome-git:GNOME/librsvg
    track: 2.*.*
    exclude:
      - 2.*-*
  - kind: cargo
    url: "cargo:"

build-depends:
  - groups/autotools.bst
  - pkgs/rust.bst
  - pkgs/meson.bst
  - pkgs/cargo-c.bst
