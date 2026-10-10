kind: pyproject

sources:
  - kind: git_repo
    url: github:certifi/python-certifi
    track: "2026.*.*"

build-depends:
  - groups/python-module.bst
