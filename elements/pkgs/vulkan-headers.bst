kind: cmake

sources:
  - kind: git_repo
    url: github:khronosgroup/vulkan-headers
    track: vulkan-sdk-*.*.*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst
