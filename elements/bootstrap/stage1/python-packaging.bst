kind: pyproject

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:pypa/packaging
    track: "*.*"
    exclude:
    - "*rc*"

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/python-build.bst
  - bootstrap/stage1/fdo.bst:components/python3-pyproject-hooks.bst
  - bootstrap/stage1/fdo.bst:components/python3-packaging.bst
  - bootstrap/stage1/fdo.bst:components/python3-installer.bst
  - bootstrap/stage1/fdo.bst:components/python3-flit-core.bst

depends:
  - pkgs/python.bst

