kind: pyproject

sources:
  - kind: git_repo
    url: github:pytest-dev/pluggy
    track: "*.*.*"

build-depends:
  - groups/python.bst

depends:
  - pkgs/python/setuptools-scm.bst

environment:
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PLUGGY: "2"
