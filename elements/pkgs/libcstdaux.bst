kind: meson

sources:
  - kind: git_repo
    url: github:c-util/c-stdaux
    track: v*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst
  - pkgs/meson.bst
