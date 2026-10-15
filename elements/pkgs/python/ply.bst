kind: pyproject

sources:
  - kind: git_repo
    url: github:dabeaz/ply.git
    track: "*.*"

build-depends:
  - groups/python.bst
  - pkgs/cython.bst
  - pkgs/libyaml.bst
