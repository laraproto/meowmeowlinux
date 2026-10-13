kind: pyproject

sources:
  - kind: git_repo
    url: github:python/poetry/poetry
    track: "*.*.*"

build-depends:
  - groups/python.bst

depends:
  - pkgs/python/poetry-core.bst
