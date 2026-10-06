kind: pyproject

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:mesonbuild/meson
    track: 1.*.*
    exclude:
    - 1.*.*rc*

depends:
  - pkgs/python-new.bst
  - bootstrap/stage1/python-build.bst
  - bootstrap/stage1/python-pyproject-hooks.bst
  - bootstrap/stage1/python-packaging.bst
  - bootstrap/stage1/python-setuptools.bst
  - bootstrap/stage1/python-installer.bst
  - bootstrap/stage1/cmake.bst
  - bootstrap/stage1/ninja.bst
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/zlib.bst
  - bootstrap/linker.bst
