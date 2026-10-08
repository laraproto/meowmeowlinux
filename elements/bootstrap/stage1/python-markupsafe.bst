kind: pyproject

(@):
  - elements/bootstrap/stage1/common.yml

sources:
- kind: git_repo
  url: github:pallets/markupsafe
  track: "*.*.*"
  exclude:
  - "*.*.x"

build-depends:
  - bootstrap/stage1/python-build.bst
  - bootstrap/stage1/python-setuptools.bst
  - bootstrap/stage1/python-pyproject-hooks.bst 
  - bootstrap/stage1/python-flit.bst
  - bootstrap/stage1/python-packaging.bst 
  - bootstrap/stage1/python-installer.bst
  - bootstrap/stage1/python.bst
  - bootstrap/stage1/zlib.bst
  - bootstrap/stage1/independent.bst
