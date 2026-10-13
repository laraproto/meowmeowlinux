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
  - bootstrap/python/setuptools.bst
  - bootstrap/python/pyproject-hooks.bst
  - bootstrap/python/packaging.bst
  - bootstrap/python/flit.bst
  - bootstrap/python/installer.bst
  - pkgs/python/build.bst
  - groups/minimum.bst

depends:
  - pkgs/python.bst

environment:
  PYTHONPATH: "/usr/lib/python3.14/site-packages:/tools/lib/python3.14/site-packages"
