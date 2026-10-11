kind: pyproject

sources:
  - kind: git_repo
    url: github:lxml/lxml
    track: lxml-6.*.*

build-depends:
  - groups/python-module.bst
  - pkgs/libxml2.bst
  - pkgs/libxslt.bst
  - groups/autotools.bst

depends:
  - pkgs/python.bst
  - pkgs/cython.bst
