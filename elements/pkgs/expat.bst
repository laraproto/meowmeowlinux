kind: autotools

build-depends:
  - groups/minimum.bst
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/libtool.bst

sources:
 - kind: git_tag
   url: github:libexpat/libexpat
   track: master

config:
  configure-commands:
    (<):
      - |
        mv -fv expat/* .
