kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: gnu
    name: gettext

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/gzip.bst

variables:
  conf-local: ac_cv_func_posix_spawn_file_actions_addchdir=yes
