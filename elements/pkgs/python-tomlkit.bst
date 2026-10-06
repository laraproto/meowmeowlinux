kind: pyproject

sources:
  - kind: git_repo
    url: github:python-poetry/tomlkit
    track: "*.*.*"

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python-poetry.bst
