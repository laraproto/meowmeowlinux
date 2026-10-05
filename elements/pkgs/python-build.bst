kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/build
    track: "*.*.*"

build-depends:
  - bootstrap/stage1/python-build.bst
  - bootstrap/stage1/python-pyproject-hooks.bst
  - bootstrap/stage1/python-packaging.bst
  - bootstrap/stage1/python-installer.bst
  - bootstrap/stage1/python-flit.bst
  - groups/minimum.bst

depends:
  - pkgs/python-new.bst
  - pkgs/zlib.bst
