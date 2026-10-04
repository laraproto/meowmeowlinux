kind: autotools

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - pkgs/glibc.bst
  - pkgs/fs.bst

depends:
  - pkgs/ncurses.bst

sources:
  - kind: gnu
    name: readline

variables:
  conf-local: --with-shared-termcap-library

config:
  configure-commands:
    (<):
      - |
        sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
