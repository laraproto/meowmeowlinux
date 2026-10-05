kind: cmake

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:ninja-build/ninja
    track: release

build-depends:
  - bootstrap/stage1/cmake.bst
  - bootstrap/stage1/independent.bst

depends:
  - bootstrap/stage1/glibc.bst

variables:
  generator: "Unix Makefiles"
  cmake-local: "-DBUILD_TESTING=OFF"

environment:
  LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
  LD_LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
