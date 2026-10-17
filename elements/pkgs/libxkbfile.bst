kind: meson

sources:
- kind: git_repo
  url: fdo-git:xorg/lib/libxkbfile.git
  track: libxkbfile-*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libx11.bst
