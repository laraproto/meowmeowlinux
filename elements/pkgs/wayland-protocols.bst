kind: meson

sources:
  - kind: git_repo
    url: fdo-git:wayland/wayland-protocols
    track: 1.*

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/wayland.bst
  - pkgs/libxml2.bst
