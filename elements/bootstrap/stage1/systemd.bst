kind: meson

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: git_repo
    url: github:systemd/systemd.git
    track: v*
    exclude:
      - "*rc*"

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/meson.bst
  - bootstrap/stage1/diffutils.bst
  - bootstrap/stage1/findutils.bst
  - bootstrap/python/jinja2.bst
  - bootstrap/python/pefile.bst
  - bootstrap/stage1/python.bst
  - bootstrap/stage1/gperf.bst
  - bootstrap/env.bst

depends:
  - bootstrap/stage1/glibc.bst
