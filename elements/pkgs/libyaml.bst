kind: autotools

sources:
  - kind: git_repo
    url: github:yaml/libyaml
    track: "[0-9]*"

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/libtool.bst
