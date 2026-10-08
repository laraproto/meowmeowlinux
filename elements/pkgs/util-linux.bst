kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:util-linux/util-linux
    track: v*.*.*
    exclude:
    - "*-*"

build-depends:
  - groups/autotools.bst
  - pkgs/gettext.bst
  - pkgs/automake.bst
  - pkgs/bison.bst
  - pkgs/libtool.bst
  - pkgs/flex.bst
  - pkgs/tar.bst
  - pkgs/gzip.bst
  - pkgs/findutils.bst
  - bootstrap/stage1/userdb.bst
