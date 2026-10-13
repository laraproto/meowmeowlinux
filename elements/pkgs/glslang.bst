kind: cmake

sources:
  - kind: git_repo
    url: github:khronosgroup/glslang
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst

depends:
  - pkgs/spirv-tools.bst

variables:
  cmake-local: >- 
    -D ALLOW_EXTERNAL_SPRIV_TOOLS=ON
    -D BUILD_SHARED_LIBS=ON
