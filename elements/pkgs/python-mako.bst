kind: pyproject

sources:
  - kind: git_repo
    url: github:sqlalchemy/mako
    track: ref_*_*_*

build-depends:
  - groups/python-module.bst
