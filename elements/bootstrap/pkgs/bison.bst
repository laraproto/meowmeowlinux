kind: autotools

sources:
- kind: gnu
  name: bison

build-depends:
- bootstrap/tools/toolchain.bst

(@):
  - elements/bootstrap/include/common.yml

# Fix the yacc command
config:
  install-commands:
    (>):
    - sed -i 's@/bin/sh@%/usr/bin/sh@' %{install-root}/usr/bin/yacc
