kind: pyproject

sources:
  - kind: git_repo
    url: github:pypa/trove-classifiers
    track: "*.*.*.*"

build-depends:
  - groups/python.bst

depends:
  - pkgs/python/calver.bst
