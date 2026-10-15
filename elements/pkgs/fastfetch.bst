kind: cmake

sources:
  - kind: git_repo
    url: github:fastfetch-cli/fastfetch
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst

depends:
  - pkgs/yyjson.bst

variables:
  cmake-local: -D ENABLE_SYSTEM_YYJSON=ON
