kind: autotools

sources:
  - kind: tar
    url: github:rockdaboot/libpsl/releases/download/0.23.3/libpsl-0.23.3.tar.gz

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/gettext.bst
  - pkgs/glib.bst
  # TODO - pkgs/gtk-doc.bst
  - pkgs/python-pygments.bst
  - pkgs/pkgconf.bst
  - pkgs/python.bst

depends:
  - pkgs/libidn2.bst
  - pkgs/libunistring.bst
