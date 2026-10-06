kind: pyproject

sources:
  - kind: git_repo
    url: github:pypa/setuptools-scm
    track: vcs-versioning-v*.*.*

build-depends:
  - groups/python-module.bst

variables:
  command-subdir: vcs-versioning
