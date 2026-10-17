kind: autotools

sources:
  - kind: git_repo
    url: fdo-git:xorg/lib/libxcb-util
    track: xcb-util-*.*
    exclude:
      - xcb-util-*-*
  - kind: git_module
    url: fdo-git:xorg/util/xcb-util-m4.git
    path: m4

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/libtool.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libxcb.bst
