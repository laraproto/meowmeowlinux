kind: pyproject

sources:
  - kind: git_repo
    url: github:pypa/hatch
    track: hatchling-v*.*.*

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python-pathspec.bst
  - pkgs/python-pluggy.bst
  - pkgs/python-tomlkit.bst
  - pkgs/python-trove-classifiers.bst

variables:
  command-subdir: backend
