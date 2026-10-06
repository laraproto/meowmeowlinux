kind: cmake

sources:
  - kind: git_repo
    url: github:tukaani-project/xz
    track: "v*.*.*"

build-depends:
  - groups/cmake.bst
