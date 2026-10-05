kind: autotools

sources:
  - kind: tar
    url: gnu-ftp:gnu/libidn/libidn2-2.3.8.tar.gz

build-depends:
  - groups/autotools.bst
  - pkgs/perl.bst
  - pkgs/findutils.bst
