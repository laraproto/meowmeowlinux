kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/setuptools
    track: "v*.*.*"
    exclude:
    - "*b*"

build-depends:
  - bootstrap/stage1/python-setuptools.bst
  - bootstrap/stage1/python-pyproject-hooks.bst
  - bootstrap/stage1/python-packaging.bst
  - bootstrap/stage1/python-flit.bst
  - bootstrap/stage1/python-installer.bst
  - pkgs/python-build.bst
  - groups/minimum.bst

depends:
  - pkgs/python-new.bst
