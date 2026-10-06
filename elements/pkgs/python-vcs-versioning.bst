kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/setuptools-scm
    track: vcs-versioning-v*.*.*

build-depends:
  - groups/python-module.bst
  - pkgs/glibc.bst
  - pkgs/bash.bst
  - bootstrap/stage1/git.bst

variables:
  command-subdir: vcs-versioning
