kind: pyproject

sources:
  - kind: git_repo
    url: github:urllib3/urllib3
    track: 2.*.*

build-depends:
  - groups/python.bst

depends:
  - pkgs/python/hatchling.bst
  - pkgs/python/hatch-vcs.bst

environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "2"

