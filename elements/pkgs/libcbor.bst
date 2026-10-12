kind: cmake

sources:
  - kind: git_repo
    url: github:pjk/libcbor.git
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst
