kind: pyproject

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:pypa/installer
    track: "*.*.*"

build-depends:
  - groups/minimum.bst
  - pkgs/python/build.bst
  - pkgs/python/pyproject-hooks.bst
  - pkgs/python/flit-core.bst
  - bootstrap/python/packaging.bst
  - bootstrap/python/installer.bst
  - pkgs/zlib.bst

depends:
  - pkgs/python.bst

environment:
  PYTHONPATH: "/usr/lib/python3.14/site-packages:/tools/lib/python3.14/site-packages"
