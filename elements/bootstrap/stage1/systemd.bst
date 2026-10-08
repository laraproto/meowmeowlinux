kind: meson

(@):
  - elements/bootstrap/stage1/common.yml

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
  - bootstrap/stage1/python-jinja2.bst
  - bootstrap/stage1/python-pefile.bst
  - bootstrap/stage1/python.bst
  - bootstrap/stage1/gperf.bst
  - bootstrap/env.bst

depends:
  - bootstrap/stage1/glibc.bst

environment:
  LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
  LD_LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
