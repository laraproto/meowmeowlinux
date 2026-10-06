kind: manual

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/rust.bst
  - bootstrap/stage1/glibc.bst
  - groups/autotools.bst
  - pkgs/gettext.bst

depends:
  - pkgs/perl.bst
  - pkgs/curl.bst
  - pkgs/openssl3.bst
  - pkgs/zlib.bst
  - pkgs/expat.bst

# TODO: install-docs
config:
  configure-commands:
    - |
      autoreconf
      ./configure --prefix=%{prefix} --without-tcltk
  build-commands:
    - | 
      make all
  install-commands:
    - |
      make DESTDIR="%{install-root}" install
