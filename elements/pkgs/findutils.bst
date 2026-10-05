kind: autotools

build-depends: 
  - groups/autotools.bst

sources:
  - kind: gnu
    name: findutils

variables:
  conf-local: --without-selinux

