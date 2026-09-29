kind: autotools

depends:
  - bootstrap/stage1/base.bst

sources:
  - kind: gnu
    name: bash

variables:
  conf-local: |
    --without-bash-malloc
