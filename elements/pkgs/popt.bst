kind: autotools

sources:
  - kind: git_repo
    url: github:rpm-software-management/popt
    track: popt-*.*-release

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
