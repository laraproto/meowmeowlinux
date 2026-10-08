kind: autotools

sources:
- kind: git_repo
  url: github:libffi/libffi
  track: v*.*.*
  exclude:
  - "*-*"

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/libtool.bst
  - pkgs/texinfo.bst
  - pkgs/findutils.bst

config:
  install-commands:
    (>):
      - rm %{install-root}/usr/share/info/dir

