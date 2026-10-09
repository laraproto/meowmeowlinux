kind: autotools

sources:
  - kind: gnu
    name: bc

build-depends:
  - groups/autotools.bst
  - pkgs/texinfo.bst

environment:
  CC: gcc -std=c99

config:
  install-commands:
    (>):
      - rm %{install-root}/usr/share/info/dir
