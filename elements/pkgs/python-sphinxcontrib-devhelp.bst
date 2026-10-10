kind: pyproject

sources:
  - kind: git_repo
    url: github:sphinx-doc/sphinxcontrib-devhelp
    track: "*.*.*"

build-depends:
  - groups/python-module.bst
