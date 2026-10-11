kind: meson

sources:
  - kind: git_repo
    url: github:c-util/c-ini
    track: v*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst
  - pkgs/meson.bst

depends:
  - pkgs/libcstdaux.bst
  - pkgs/libcutf8.bst
  - pkgs/libcrbtree.bst
  - pkgs/libclist.bst
