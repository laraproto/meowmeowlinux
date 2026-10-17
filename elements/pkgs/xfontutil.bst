kind: autotools

sources:
- kind: git_repo
  url: fdo-git:xorg/font/util.git
  track: font-util-*

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/util-macros.bst
