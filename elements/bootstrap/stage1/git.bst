kind: manual

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:git/git
    track: v*.*.*
    exclude:
    - "*-*"

build-depends:
  - bootstrap/stage1/rust.bst
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/gcc.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/findutils.bst
  - bootstrap/stage1/diffutils.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/expat.bst
  - bootstrap/stage1/tar.bst
  - bootstrap/stage1/gettext.bst

depends:
  - bootstrap/stage1/openssl3.bst
  - bootstrap/stage1/zlib.bst
  - bootstrap/stage1/curl.bst
  - bootstrap/stage1/perl.bst
  - bootstrap/stage1/pcre2.bst

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

environment:
  LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
  LD_LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
