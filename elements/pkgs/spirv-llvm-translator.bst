kind: cmake

sources:
  - kind: git_repo
    url: github:khronosgroup/spirv-llvm-translator
    track: v*.*.*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst

depends:
  - pkgs/libxml2.bst
  - pkgs/spirv-tools.bst
  - pkgs/llvm.bst

variables:
  cmake-local: >-
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=%{prefix}
