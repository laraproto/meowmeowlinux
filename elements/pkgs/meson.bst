kind: pyproject

sources:
  - kind: git_repo
    url: github:mesonbuild/meson
    track: 1.*.*
    exclude:
    - 1.*.*rc*

depends:
  - pkgs/python-new.bst
  - pkgs/python-build.bst
  - pkgs/python-setuptools.bst
  - pkgs/ninja.bst
  - groups/minimum.bst
