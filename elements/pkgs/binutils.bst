kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: gnu
    name: binutils

variables:
  conf-local: |
    --enable-gprofng
    --enable-new-dtags
    --enable-default-hash-style=gnu
