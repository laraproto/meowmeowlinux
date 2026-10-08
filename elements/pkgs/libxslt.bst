kind: autotools

sources: 
  - kind: git_repo
    url: gnome-git:GNOME/libxslt
    track: v*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/libtool.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/diffutils.bst
  - pkgs/python.bst
  - pkgs/libtool.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libxml2.bst

variables:
  conf-local: --disable-static --without-python
