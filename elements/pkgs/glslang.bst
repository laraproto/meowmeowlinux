kind: cmake

sources:
  - kind: git_repo
    url: github:khronosgroup/glslang
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst

depends:
  - pkgs/spirv-tools.bst

variables:
  cmake-local: >- 
    -D ALLOW_EXTERNAL_SPIRV_TOOLS=ON
    -D BUILD_SHARED_LIBS=ON
