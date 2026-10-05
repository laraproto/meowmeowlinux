kind: cmake

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_tag
    url: github:Kitware/CMake
    track: release

build-depends:
  - groups/autotools.bst
  - bootstrap/stage1/cmake.bst

depends:
  - pkgs/libidn2.bst
  - pkgs/openssl3.bst
  - pkgs/ninja.bst
