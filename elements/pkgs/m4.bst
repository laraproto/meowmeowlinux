kind: autotools

sources:
  - kind: gnu
    name: m4

build-depends:
  - pkgs/gcc.bst
  - pkgs/bash.bst
  - pkgs/coreutils.bst
  - pkgs/sed.bst
  - pkgs/grep.bst
  - pkgs/gawk.bst
  - pkgs/make.bst

variables:
  conf-local: ac_cv_func_posix_spawn_file_actions_addchdir=yes
