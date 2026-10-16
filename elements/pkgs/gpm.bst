kind: autotools

sources:
  - kind: git_repo
    url: github:telmich/gpm
    track: 1.[0-80]*
    exclude:
      - "*pre*"

build-depends:
  - groups/autotools.bst
  - pkgs/libtool.bst

variables:
  conf-local: ac_cv_path_emacs=no
