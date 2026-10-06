kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/setuptools-scm
    track: setuptools-scm-v*.*.*

build-depends:
  - groups/python-module.bst
  - bootstrap/stage1/git.bst

depends:
  - pkgs/python-vcs-versioning.bst

variables:
  command-subdir: setuptools-scm
