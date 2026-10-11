kind: autotools

sources:
  - kind: tar
    url: xorg:util/util-macros-1.20.2.tar.xz

build-depends:
  - groups/autotools.bst

config:
  build-commands:
    - |
      echo "Intentionally does not use a build command."
