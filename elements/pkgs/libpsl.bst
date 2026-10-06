kind: autotools

sources:
  - kind: git_repo
    url: github:rockdaboot/libpsl
    track: libpsl-*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/gettext.bst
  - pkgs/gtk-doc.bst
  - pkgs/python-pygments.bst
