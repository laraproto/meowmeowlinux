kind: pyproject

sources:
  - kind: git_repo
    url: github:AA-Turner/roman-numerals
    track: "v*.*.*"

build-depends:
  - groups/python.bst

config:
  configure-commands:
    - |
      cp -r python/. .
