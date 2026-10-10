kind: pyproject

sources:
  - kind: git_repo
    url: github:AA-Turner/roman-numerals
    track: "v*.*.*"

build-depends:
  - groups/python-module.bst

config:
  configure-commands:
    - |
      cp -r python/. .
