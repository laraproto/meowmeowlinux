kind: pyproject

sources:
  - kind: git_repo
    url: github:pygments/pygments
    track: 2.*.*

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python-hatchling.bst
