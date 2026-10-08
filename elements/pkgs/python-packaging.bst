kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/packaging
    track: "*.*"
    exclude:
    - "*rc*"

build-depends:
  - groups/minimum.bst
  - pkgs/python-build.bst
  - pkgs/python-pyproject-hooks.bst
  - pkgs/python-installer.bst
  - pkgs/python-flit-core.bst
  - bootstrap/stage1/python-packaging.bst

depends:
  - pkgs/python.bst

environment:
  PYTHONPATH: "/usr/lib/python3.14/site-packages:/tools/lib/python3.14/site-packages"

