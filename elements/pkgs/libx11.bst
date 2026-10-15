kind: autotools

sources:
  - kind: tar
    url: xorg:lib/libX11-1.8.13.tar.xz

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/m4.bst
  - pkgs/libtool.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libxcb.bst
  - pkgs/xtrans.bst

config:
  configure-commands:
    (<):
      # Broken.
      - rm -v configure
