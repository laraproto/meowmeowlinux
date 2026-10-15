kind: autotools

sources:
  - kind: git_repo
    url: gitlab:libpipeline/libpipeline.git
    track: "*.*.*"
    exclude:
      - "*-pre*"
      # legacy weird tags
      - "2.*"
  - kind: git_repo
    url: savannah:gnulib.git
    track: v*.*
    directory: gnulib

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/libtool.bst
  - pkgs/git.bst
  - pkgs/pkgconf.bst
  - pkgs/findutils.bst

depends:
  - pkgs/gdbm.bst

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=gnulib
