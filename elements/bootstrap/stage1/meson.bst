kind: pyproject

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: git_repo
    url: github:mesonbuild/meson
    track: 1.*.*
    exclude:
    - 1.*.*rc*

depends:
  - bootstrap/stage1/python.bst
  - bootstrap/python/build.bst
  - bootstrap/python/pyproject-hooks.bst
  - bootstrap/python/packaging.bst
  - bootstrap/python/setuptools.bst
  - bootstrap/python/installer.bst
  - bootstrap/stage1/cmake.bst
  - bootstrap/stage1/ninja.bst
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/zlib.bst
  - bootstrap/linker.bst
