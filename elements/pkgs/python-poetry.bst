kind: pyproject

sources:
  - kind: git_repo
    url: github:python-poetry/poetry
    track: "*.*.*"

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python-poetry-core.bst
