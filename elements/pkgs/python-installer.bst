kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/installer
    track: "*.*.*"

build-depends:
  - groups/minimum.bst
  - pkgs/python-build.bst
  - pkgs/python-pyproject-hooks.bst
  - pkgs/python-flit-core.bst
  - bootstrap/stage1/python-packaging.bst
  - bootstrap/stage1/python-installer.bst
  - pkgs/zlib.bst

depends:
  - pkgs/python-new.bst
