kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/build
    track: "*.*.*"

build-depends:
  - bootstrap/python/build.bst
  - bootstrap/python/pyproject-hooks.bst
  - bootstrap/python/packaging.bst
  - bootstrap/python/installer.bst
  - bootstrap/python/flit.bst
  - groups/minimum.bst

depends:
  - pkgs/python.bst
  - pkgs/zlib.bst

environment:
  PYTHONPATH: "/usr/lib/python3.14/site-packages:/tools/lib/python3.14/site-packages"
