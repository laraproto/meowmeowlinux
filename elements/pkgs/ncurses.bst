kind: autotools

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/stage1.bst
  - bootstrap/linker.bst

sources:
  - kind: git_repo
    url: github:ThomasDickey/ncurses-snapshots.git
    track: "v*"
    exclude:
      - "v*_*_*"

variables:
  conf-local: >-
    --enable-widec
    --disable-root-access
    --disable-root-environ
    --disable-setuid-environ
    --with-cxx-binding
    --with-cxx-shared

  
