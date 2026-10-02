kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: diffutils

variables:
  conf-local: >-
    gl_cv_func_strcasecmp_works=yes
