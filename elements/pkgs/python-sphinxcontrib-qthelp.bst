kind: pyproject

sources:
  - kind: git_repo
    url: github:sphinx-doc/sphinxcontrib-qthelp
    track: "*.*.*"
    exclude:
    - v*rc*

build-depends:
  - groups/python-module.bst
