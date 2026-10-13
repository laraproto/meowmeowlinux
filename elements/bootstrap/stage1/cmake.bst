kind: cmake

(@):
  - elements/bootstrap/common.yml

build-depends:
  - bootstrap/stage1/fdo.bst:public-stacks/buildsystem-cmake.bst
  - bootstrap/stage1/independent.bst

depends:
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/libidn2.bst
  - bootstrap/stage1/openssl3.bst

sources:
  - kind: git_tag
    url: github:Kitware/CMake
    track: release
