kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
- kind: git_repo
  url: github:libffi/libffi
  track: v*.*.*
  exclude:
  - "*-*"

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/libtool.bst
  - bootstrap/stage1/texinfo.bst

config:
  install-commands:
    (>):
      - rm %{install-root}/tools/share/info/dir

