kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/flit
    track: "3.*.*"

build-depends:
  - groups/minimum.bst
  - bootstrap/stage1/python-flit.bst
  - bootstrap/stage1/python-pyproject-hooks.bst
  - bootstrap/stage1/python-packaging.bst
  - bootstrap/stage1/python-installer.bst
  - bootstrap/stage1/python-build.bst

depends:
  - pkgs/python-new.bst
  - pkgs/zlib.bst

variables:
  command-subdir: flit_core
