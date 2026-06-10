kind: stack
description: This is the bootstrap, configured to produce executables that link against toolchain's libraries

(@):
  - elements/bootstrap/include/common.yml

depends:
- bootstrap/pkgs/fs.bst
- bootstrap/all.bst
