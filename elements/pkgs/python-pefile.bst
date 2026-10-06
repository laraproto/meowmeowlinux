kind: pyproject

sources:
- kind: git_repo
  url: github:erocarrera/pefile
  track: "v*.*.*"

build-depends:
  - groups/python-module.bst
