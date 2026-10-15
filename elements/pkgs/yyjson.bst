kind: cmake

sources:
  - kind: git_repo  
    url: github:ibireme/yyjson
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst
