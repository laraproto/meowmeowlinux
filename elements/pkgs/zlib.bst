kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
- kind: git_repo
  url: github:zlib-ng/zlib-ng.git
  track: "*.*.*"
  exclude:
  - "v*"
  - "*-*"

variables:
  conf-local: >-
    --zlib-compat
  conf-args: --prefix=%{prefix} %{conf-local}
