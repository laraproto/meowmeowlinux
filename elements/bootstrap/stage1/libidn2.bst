kind: autotools

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: tar
    url: gnu-ftp:gnu/libidn/libidn2-2.3.8.tar.gz

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/perl.bst
  - bootstrap/stage1/findutils.bst
