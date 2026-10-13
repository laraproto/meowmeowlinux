kind: cmake

sources:
  - kind: git_repo
    url: github:github/cmark-gfm
    track: "*.*.*.gfm.*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst

depends:
  - pkgs/python.bst

variables:
  # Theres no actual incompatibability, just an unchanged number.
  cmake-local: -D CMAKE_POLICY_VERSION_MINIMUM=3.5
