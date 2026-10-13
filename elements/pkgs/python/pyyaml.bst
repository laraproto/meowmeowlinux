kind: pyproject

sources:
  - kind: git_repo
    url: github:yaml/pyyaml
    track: 6.*.*

build-depends:
  - groups/python.bst
  - pkgs/cython.bst
  - pkgs/libyaml.bst
