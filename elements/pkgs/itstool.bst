kind: autotools

sources:
  - kind: git_repo
    url: github:itstool/itstool
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/python.bst
  - pkgs/libxml2.bst
  - pkgs/lxml.bst
  - pkgs/pkgconf.bst
