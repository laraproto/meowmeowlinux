kind: pyproject

sources:
  - kind: git_repo
    url: github:ofek/hatch-vcs
    track: v*.*.*

build-depends:
  - groups/python.bst

depends:
  - pkgs/python/hatchling.bst
