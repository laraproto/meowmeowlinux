kind: meson

sources:
  - kind: git_repo
    url: fdo-git:mesa/libdrm
    track: libdrm-*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
