kind: autotools

sources:
  - kind: git_repo
    url: github:swig/swig
    track: v*.*.*
    exclude:
      - v*-*

build-depends:
  - groups/autotools.bst
  - pkgs/pcre2.bst
  - pkgs/zlib.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/m4.bst
  - pkgs/bison.bst
