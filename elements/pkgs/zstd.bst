kind: make

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git
    url: github:facebook/zstd
    track: release

build-depends:
  - bootstrap/stage1/independent.bst
  - pkgs/glibc.bst
