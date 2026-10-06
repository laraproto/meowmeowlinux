kind: pyproject

sources:
  - kind: git_repo
    url: github:pypa/trove-classifiers
    track: "*.*.*.*"

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python-calver.bst
