kind: make

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git
    url: github:facebook/zstd
    track: release

build-depends:
  - bootstrap/stage1/base.bst
