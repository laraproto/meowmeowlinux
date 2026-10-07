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
  - pkgs/python.bst
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

# Hack until world rebuild
config:
  configure-commands:
      - |
        mkdir -pv %{install-root}/tools/bin
        ln -sv /tools/bin/python3 %{install-root}/tools/bin/python

  install-commands:
    (>):
      - |
        rm %{install-root}/tools/bin/python

environment:
  PATH: "%{install-root}/tools/bin:/tools/bin:/usr/bin"
