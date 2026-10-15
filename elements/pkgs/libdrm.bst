kind: meson

sources:
  - kind: git_repo
    url: fdo-git:mesa/libdrm
    track: libdrm-*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/systemd.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libpciaccess.bst

variables:
  meson-local: -D udev=true
