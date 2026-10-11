kind: meson

sources:
  - kind: git_repo
    url: fdo-git:wayland/wayland
    track: 1.*.*

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/libxml2.bst
  - pkgs/libffi.bst
  - pkgs/pkgconf.bst

variables:
  meson-local: -D documentation=false
