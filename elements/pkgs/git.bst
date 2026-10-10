kind: meson

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: kernel:git/git.git
    track: v*.*.*
    exclude:
      - v*-*

build-depends:
  - bootstrap/stage1/rust.bst
  - bootstrap/stage1/glibc.bst
  - groups/autotools.bst
  - pkgs/gettext.bst
  - pkgs/m4.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/perl.bst
  - pkgs/curl.bst
  - pkgs/openssl3.bst
  - pkgs/zlib.bst
  - pkgs/expat.bst
  - pkgs/diffutils.bst
  - pkgs/tar.bst
  - pkgs/curl.bst

variables:
  meson-local: >-
    -D gitk=disabled
    -D git_gui=disabled
    -D tests=false
