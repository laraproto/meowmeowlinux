kind: autotools

sources:
  - kind: git_repo
    url: github:dosfstools/dosfstools
    track: v4.*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/gettext.bst

variables:
  conf-local: --enable-compat-symlinks
