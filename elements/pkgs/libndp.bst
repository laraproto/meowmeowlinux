kind: autotools

sources:
  - kind: git_repo
    url: github:jpirko/libndp
    track: v*

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/findutils.bst
  - pkgs/libtool.bst
