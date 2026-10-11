kind: autotools

sources:
  - kind: git_repo
    url: fdo-git:fontconfig/fontconfig
    track: 2.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/gettext.bst
  - pkgs/libtool.bst
  - pkgs/gperf.bst
  - pkgs/tar.bst
  - pkgs/gzip.bst
  - pkgs/findutils.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/python.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/freetype2.bst

variables:
  conf-local: --disable-docs
