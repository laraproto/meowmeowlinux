kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/flit
    track: "3.*.*"

build-depends:
  - groups/minimum.bst
  - bootstrap/python/flit.bst
  - bootstrap/python/pyproject-hooks.bst
  - bootstrap/python/packaging.bst
  - bootstrap/python/installer.bst
  - bootstrap/python/build.bst

depends:
  - pkgs/python.bst
  - pkgs/zlib.bst

variables:
  command-subdir: flit_core

environment:
  PYTHONPATH: "/usr/lib/python3.14/site-packages:/tools/lib/python3.14/site-packages"
