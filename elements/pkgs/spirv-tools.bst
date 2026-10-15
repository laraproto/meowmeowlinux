kind: cmake

sources:
  - kind: git_repo
    url: github:khronosgroup/spirv-tools
    track: vulkan-sdk-1.*.*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst

depends:
  - pkgs/spirv-headers.bst
  - pkgs/python.bst

variables:
  cmake-local: >-
    -D BUILD_SHARED_LIBS=ON
    -D SPIRV-Headers_SOURCE_DIR=/usr
    -D SPIRV_TOOLS_BUILD_STATIC=OFF
