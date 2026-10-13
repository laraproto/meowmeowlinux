kind: pyproject

sources:
  - kind: git_repo
    url: github:snowballstem/snowball
    track: v*.*.*

build-depends:
  - groups/python.bst

config:
  configure-commands:
    - |
      touch modules.txt
      cp -rv python/* .
      mkdir src
      mv snowballstemmer src
