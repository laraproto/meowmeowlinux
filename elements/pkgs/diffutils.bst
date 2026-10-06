kind: autotools

build-depends:
  - groups/autotools.bst

sources:
  - kind: gnu
    name: diffutils

variables:
  conf-local: >-
    gl_cv_func_strcasecmp_works=yes
