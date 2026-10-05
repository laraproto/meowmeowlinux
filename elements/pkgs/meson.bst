kind: pyproject

sources:
  - kind: git_repo
    url: github:mesonbuild/meson
    track: 1.*.*
    exclude:
    - 1.*.*rc*

build-depends:
  - pkgs/python-build.bst
  - pkgs/python-setuptools.bst
  - pkgs/python-pyproject-hooks.bst 
  - pkgs/python-packaging.bst 
  - pkgs/python-installer.bst

depends:
  - pkgs/python-new.bst
  - pkgs/ninja.bst
  - groups/minimum.bst
  - pkgs/zlib.bst
