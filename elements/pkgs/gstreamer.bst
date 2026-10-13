kind: meson

sources:
  - kind: git_repo
    url: fdo-git:gstreamer/gstreamer
    track: 1.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/glib.bst
  - pkgs/pkgconf.bst
  - pkgs/flex.bst
  - pkgs/bison.bst

depends:
  - pkgs/libdrm.bst
  - pkgs/libgudev.bst
  - pkgs/libogg.bst
