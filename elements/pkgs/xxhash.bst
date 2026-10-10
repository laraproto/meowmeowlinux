kind: make

sources:
  - kind: git_repo
    url: github:cyan4973/xxhash
    track: v*.*.*

build-depends:
  - groups/autotools.bst
