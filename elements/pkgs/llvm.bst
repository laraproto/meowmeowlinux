kind: cmake

sources:
  - kind: git_repo
    url: github:llvm/llvm-project
    track: llvmorg-*.*.*
    exclude:
      - llvmorg-*-*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst
  - pkgs/python-new.bst

variables:
  cmake-local: -S llvm
