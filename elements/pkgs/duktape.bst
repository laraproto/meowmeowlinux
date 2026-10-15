kind: manual

sources:
  - kind: tar
    url: duktape:duktape-2.7.0.tar.xz

build-depends:
  - groups/autotools.bst

config:
  # Remove the built in CFLAG
  configure-commands:
    - sed -i 's/-Os//' Makefile.sharedlibrary
  build-commands:
    - make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr
  install-commands:
    - make -f Makefile.sharedlibrary DESTDIR=%{install-root} install
