kind: autotools

(@):
  - elements/bootstrap/use.yml

depends:
  - pkgs/glibc.bst
  - pkgs/gmp.bst

sources:
  - kind: gnu
    name: mpfr

variables:
  conf-local: CFLAGS="-std=c17"

config:
  install-commands:
    (>):
      - | 
        rm -v %{install-root}/usr/share/info/dir
