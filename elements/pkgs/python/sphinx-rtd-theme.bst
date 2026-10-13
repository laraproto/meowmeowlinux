kind: pyproject

sources:
  - kind: git_repo
    url: github:readthedocs/sphinx_rtd_theme
    track: "*.*.*"
    exclude:
      - "*rc*"

build-depends:
  - groups/python.bst
