kind: meson

sources:
  - kind: git_repo
    url: fdo-git:pixman/pixman
    track: pixman-*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
