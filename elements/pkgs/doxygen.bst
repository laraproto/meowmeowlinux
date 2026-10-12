kind: cmake

sources:
  - kind: git_repo
    url: github:doxygen/doxygen
    track: Release_1_*_*

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst
  - pkgs/git.bst
  - pkgs/flex.bst
  - pkgs/bison.bst

depends:
  - pkgs/python.bst
