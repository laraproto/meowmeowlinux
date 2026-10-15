kind: autotools

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/git.bst
  - pkgs/bison.bst

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=%{build-root}/gnulib

sources:
  - kind: git_repo
    url: savannah:patch.git
    track: v*
  - kind: git_module
    path: gnulib
    url: savannah:gnulib.git
