kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:curl/curl
    track: curl-*_*_*
    exclude:
    - curl-*-*

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/stage1/automake.bst
  - bootstrap/stage1/m4.bst
  - bootstrap/stage1/libtool.bst
  - bootstrap/stage1/libpsl.bst

depends:
  - bootstrap/stage1/openssl.bst

variables:
  conf-local: --with-openssl
