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
  - pkgs/xtrans.bst
  - pkgs/findutils.bst
  - pkgs/diffutils.bst
  # TODO: xslt & xmlto for docs

depends:
  - pkgs/libxcb.bst
  - pkgs/xorgproto.bst

config:
  configure-commands:
    (<):
      # Broken.
      - rm -v configure
