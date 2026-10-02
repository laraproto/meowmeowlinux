kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/base.bst

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
