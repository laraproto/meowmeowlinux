kind: make

sources:
  - kind: git_repo
    url: github:lz4/lz4
    track: "v*.*.*"

build-depends:
  - groups/autotools.bst
