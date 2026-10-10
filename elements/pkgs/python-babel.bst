kind: pyproject

sources:
  - kind: git_repo
    url: github:python-babel/babel
    track: v*.*.*
  - kind: remote
    url: unicode:cldr/47/cldr-common-47.zip
    directory: cldr
    filename: cldr-common-47.0.zip

build-depends:
  - groups/python-module.bst
  - groups/autotools.bst

config:
  configure-commands:
    - |
      python setup.py import_cldr
