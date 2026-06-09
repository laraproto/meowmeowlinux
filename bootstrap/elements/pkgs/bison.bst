kind: autotools

sources:
- kind: gnu
  name: bison

build-depends:
- tools/toolchain.bst

# Fix the yacc command
config:
  install-commands:
    (>):
    - sed -i 's@/bin/sh@%{bindir}/sh@' %{install-root}%{bindir}/yacc
