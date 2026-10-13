kind: pyproject

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: git_repo
    url: github:pypa/flit
    track: "3.*.*"

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/fdo.bst:components/python3-flit-core.bst
  - bootstrap/stage1/fdo.bst:components/python3-pyproject-hooks.bst
  - bootstrap/stage1/fdo.bst:components/python3-packaging.bst
  - bootstrap/python/installer.bst
  - bootstrap/python/build.bst

depends:
  - bootstrap/stage1/python.bst

variables:
  command-subdir: flit_core

environment:
  PYTHONPATH: "/usr/lib/python3.14/site-packages:/tools/lib/python3.14/site-packages"
