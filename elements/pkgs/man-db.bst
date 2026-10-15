kind: autotools

sources:
  - kind: git_repo
    url: gitlab:man-db/man-db
    track: "*.*.*"
    exclude:
      - "*-pre*"
  - kind: git_repo
    url: savannah:gnulib.git
    track: v*.*
    directory: gnulib

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/libtool.bst
  - pkgs/findutils.bst
  - pkgs/systemd.bst
  - pkgs/python.bst
  - pkgs/gettext.bst
  - pkgs/git.bst
  - pkgs/flex.bst
  - pkgs/patch.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/util-linux.bst
  - pkgs/groff.bst
  - pkgs/less.bst
  - pkgs/gzip.bst
  - pkgs/libpipeline.bst
  - pkgs/libseccomp.bst
  - pkgs/gdbm.bst

variables:
  autogen: ./bootstrap --skip-po --no-git --gnulib-srcdir=%{build-root}/gnulib
  conf-local: >-
    --disable-cache-owner
