kind: cmake

sources:
  - kind: git_repo
    url: xiph:opus
    track: v*
    exclude:
      - "v*-*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst

variables:
  cmake-local:
    -D OPUS_DNN=OFF
