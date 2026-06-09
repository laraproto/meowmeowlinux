kind: stack
description: This is the bootstrap, configured to produce executables that link against final system's libraries

depends:
- bootstrap/pkgs/fs.bst
- bootstrap/tools/adjusted-paths.bst
