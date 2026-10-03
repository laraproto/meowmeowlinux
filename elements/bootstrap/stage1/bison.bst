kind: autotools

(@): 
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/perl.bst

depends:
  - bootstrap/stage1/m4.bst

sources:
  - kind: gnu
    name: bison

variables:
  conf-local: ac_cv_func_posix_spawn_file_actions_addchdir=yes
