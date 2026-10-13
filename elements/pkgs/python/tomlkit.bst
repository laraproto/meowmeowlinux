kind: pyproject

sources:
  - kind: git_repo
    url: github:python/poetry/tomlkit
    track: "*.*.*"

build-depends:
  - groups/python.bst

depends:
  - pkgs/python/poetry.bst
