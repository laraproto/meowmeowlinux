kind: pyproject

sources:
  - kind: git_repo
    url: github:cython/cython
    track: 3.2.*
    exclude:
      - 3*b*
      - 3*a*

build-depends:
  - groups/autotools.bst
  - groups/python-module.bst
