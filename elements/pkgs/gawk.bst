kind: autotools

(@):
  - elements/bootstrap/use.yml

build-depends:
  - bootstrap/stage1/independent.bst
  - pkgs/glibc.bst
  - pkgs/fs.bst

runtime-depends:
  - pkgs/readline.bst
  # - pkgs/mpfr.bst # TODO: Next World Rebuild

sources:
  - kind: gnu
    name: gawk
