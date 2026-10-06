kind: pyproject

sources:
  - kind: git_repo
    url: github:pypa/setuptools-scm
    track: setuptools-scm-v*.*.*

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python-vcs-versioning.bst

variables:
  command-subdir: setuptools-scm
