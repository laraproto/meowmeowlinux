kind: stack
description: This is the bootstrap, configured to produce executables that link against final system's libraries

(@):
  - elements/bootstrap/include/common.yml

depends:
- bootstrap/pkgs/fs.bst
- bootstrap/tools/adjusted-paths.bst
