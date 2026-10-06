kind: pyproject

sources:
- kind: git_repo
  url: github:pallets/jinja.git
  track: "*.*.*"
  exclude:
  - "*.*.x"

build-depends:
  - groups/python-module.bst

depends:
  - pkgs/python-markupsafe.bst
