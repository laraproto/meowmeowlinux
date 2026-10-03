kind: autotools

(@): 
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/independent.bst

sources:
  - kind: gnu
    name: m4

variables:
  conf-local: ac_cv_func_posix_spawn_file_actions_addchdir=yes
