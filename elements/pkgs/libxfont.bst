kind: autotools

sources:
  - kind: git_repo
    url: fdo-git:xorg/lib/libxfont.git
    track: libXfont2-*

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/pkgconf.bst
  - pkgs/libtool.bst
  - pkgs/xtrans.bst

depends:
  - pkgs/harfbuzz.bst
  - pkgs/libfontenc.bst
