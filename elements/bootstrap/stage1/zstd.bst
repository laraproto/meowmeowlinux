kind: make

sources:
  - kind: git
    url: github:facebook/zstd
    track: release

build-depends:
  - bootstrap/stage1/base.bst
