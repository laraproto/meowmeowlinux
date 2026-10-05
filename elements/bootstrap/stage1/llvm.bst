kind: manual

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:llvm/llvm-project
    track: llvmorg-*.*.*
    exclude:
      - llvmorg-*-*

build-depends:
  - bootstrap/stage1/ninja.bst
  - bootstrap/stage1/cmake.bst
  - bootstrap/stage1/independent.bst
