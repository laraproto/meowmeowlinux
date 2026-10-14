kind: meson

sources:
  - kind: git_repo
    url: fdo-git:plymouth/plymouth
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/git.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/systemd.bst
  - pkgs/cairo.bst
  - pkgs/fontconfig.bst
  - pkgs/libdrm.bst
  - pkgs/libpng.bst
  - pkgs/libx11.bst
  - pkgs/freetype2.bst
