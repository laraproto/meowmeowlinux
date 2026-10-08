kind: pyproject

sources:
  - kind: git_repo
    url: github:lxml/lxml
    track: lxml-6.*.*

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python.bst
