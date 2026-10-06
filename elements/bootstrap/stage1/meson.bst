kind: pyproject

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:mesonbuild/meson
    track: 1.*.*
    exclude:
    - 1.*.*rc*

build-depends:
  - bootstrap/stage1/python-build.bst
  - bootstrap/stage1/python-setuptools.bst
  - bootstrap/stage1/python-pyproject-hooks.bst 
  - bootstrap/stage1/python-packaging.bst 
  - bootstrap/stage1/python-installer.bst

depends:
  - pkgs/python.bst
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/ninja.bst
  - bootstrap/stage1/zlib.bst

# Remove everything below this line once pkgs/python.bst world rebuild

config:
  configure-commands:
      - |
        mkdir %{install-root}/tools/bin -pv
        ln -sv /tools/bin/python3 %{install-root}/tools/bin/python
  
environment:
  PATH: "%{install-root}/tools/bin/:/tools/bin:/usr/bin"
      
