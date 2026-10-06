kind: autotools

sources:
  - kind: gnu
    name: gettext

build-depends:
  - groups/autotools.bst
  - pkgs/gzip.bst

variables:
  conf-local: ac_cv_func_posix_spawn_file_actions_addchdir=yes
