kind: cmake

sources:
  - kind: git_repo
    url: github:khronosgroup/vulkan-loader
    track: vulkan-sdk-*.*.*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst

depends:
  - pkgs/libxcb.bst
  - pkgs/vulkan-headers.bst
  - pkgs/wayland.bst

variables:
  cmake-local: -D CMAKE_SKIP_INSTALL_RPATH=ON
