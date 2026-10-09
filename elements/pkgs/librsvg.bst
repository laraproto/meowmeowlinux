kind: meson

sources:
  - kind: git_repo
    url: gnome-git:GNOME/librsvg
    track: 2.*.*
    exclude:
      - 2.*-*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
