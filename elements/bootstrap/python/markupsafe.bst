kind: pyproject

(@):
  - elements/bootstrap/common.yml

sources:
- kind: git_repo
  url: github:pallets/markupsafe
  track: "*.*.*"
  exclude:
  - "*.*.x"

build-depends:
  - bootstrap/python/build.bst
  - bootstrap/python/setuptools.bst
  - bootstrap/python/pyproject-hooks.bst 
  - bootstrap/python/flit.bst
  - bootstrap/python/packaging.bst 
  - bootstrap/python/installer.bst
  - bootstrap/stage1/python.bst
  - bootstrap/stage1/zlib.bst
  - bootstrap/stage1/independent.bst
