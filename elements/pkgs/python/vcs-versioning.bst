kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/setuptools-scm
    track: release/main

build-depends:
  - groups/python.bst
  - pkgs/glibc.bst
  - pkgs/bash.bst
  - pkgs/grep.bst
  - bootstrap/stage1/git.bst

variables:
  command-subdir: vcs-versioning
