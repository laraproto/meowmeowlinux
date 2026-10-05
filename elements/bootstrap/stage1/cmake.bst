kind: cmake

(@):
  - elements/bootstrap/stage1/common.yml

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

environment:
  LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
  LD_LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
