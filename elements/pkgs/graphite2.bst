kind: cmake

sources:
  - kind: git_repo
    url: github:silnrsi/graphite
    track: 1.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst
  - pkgs/sed.bst
  - pkgs/harfbuzz-stage1.bst
  - pkgs/findutils.bst

variables:
  cmake-local: -D CMAKE_VERBOSE_MAKEFILE=ON

config:
  configure-commands:
    (<):
      - |
        # Sourced from BLFS v13.1
        sed -i '/cmake_policy(SET CMP0012 NEW)/d' CMakeLists.txt
        sed -i 's/PythonInterp/Python3/' CMakeLists.txt
        find . -name CMakeLists.txt | xargs sed -i 's/VERSION 2.8.0 FATAL_ERROR/VERSION 4.0.0/'
        sed -i '/Font.h/i #include <cstdint>' tests/featuremap/featuremaptest.cpp
