kind: cmake

sources:
  - kind: git_repo
    url: github:khronosgroup/spirv-headers
    track: vulkan-sdk-1.*.*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst
