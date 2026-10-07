kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:westes/flex
    track: v*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/gettext.bst
  - pkgs/meson.bst
  - pkgs/libtool.bst
  - pkgs/tar.bst
  - pkgs/gzip.bst
  - pkgs/findutils.bst
  - pkgs/bison.bst
  - bootstrap/stage1/flex.bst
