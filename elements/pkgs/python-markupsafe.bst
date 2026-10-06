kind: pyproject

sources:
- kind: git_repo
  url: github:pallets/markupsafe
  track: "*.*.*"
  exclude:
  - "*.*.x"

build-depends:
  - groups/python-module.bst
