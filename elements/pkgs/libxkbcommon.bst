kind: meson

sources:
  - kind: git_repo
    url: github:xkbcommon/libxkbcommon
    track: xkbcommon-1.*.*
    exclude:
      - xkbcommon-*-*

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/bison.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libxcb.bst
  - pkgs/wayland.bst
  - pkgs/wayland-protocols.bst
  - pkgs/xkeyboardconfig.bst
  - pkgs/xwayland.bst

variables:
  meson-local: -D enable-docs=false -D enable-x11=false
