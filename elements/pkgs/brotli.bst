kind: cmake

sources:
  - kind: git_repo
    url: github:google/brotli
    track: v*
    exclude:
    - "*rc*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst
