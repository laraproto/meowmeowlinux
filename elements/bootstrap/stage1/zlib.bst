kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
- kind: git_repo
  url: github:zlib-ng/zlib-ng.git
  track: "*.*.*"
  exclude:
  - "v*"
  - "*-*"

build-depends:
  - bootstrap/stage1/independent.bst

variables:
  conf-local: >-
    --zlib-compat
  conf-args: --prefix=%{prefix} %{conf-local}
