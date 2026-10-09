kind: make

sources:
  - kind: git_repo
    url: sourcehut:~sircmpwn/scdoc
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
