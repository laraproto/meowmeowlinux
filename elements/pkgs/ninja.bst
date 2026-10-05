kind: cmake

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_tag
    url: github:ninja-build/ninja
    track: release

build-depends:
  - bootstrap/stage1/cmake.bst
  - bootstrap/stage1/ninja.bst
  - bootstrap/stage1/glibc.bst
  - groups/autotools.bst

variables:
  cmake-local: "-DBUILD_TESTING=OFF"
