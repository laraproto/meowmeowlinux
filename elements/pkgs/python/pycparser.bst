kind: pyproject

sources:
  - kind: git_repo
    url: github:eliben/pycparser.git
    track: release_v*

build-depends:
  - groups/python.bst
  - pkgs/cython.bst
  - pkgs/libyaml.bst
