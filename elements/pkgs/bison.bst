kind: autotools

sources:
  - kind: gnu
    name: bison

build-depends:
  - groups/autotools.bst
  - pkgs/perl.bst
  - pkgs/texinfo.bst

depends:
  - pkgs/m4.bst

variables:
  conf-local: ac_cv_func_posix_spawn_file_actions_addchdir=yes
