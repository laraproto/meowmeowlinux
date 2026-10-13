kind: pyproject

sources:
  - kind: git_repo
    url: github:sphinx-doc/sphinx
    track: "*.*.*"
    exclude:
    - v*rc*

build-depends:
  - groups/python.bst

runtime-depends:
  - pkgs/python/snowball.bst
