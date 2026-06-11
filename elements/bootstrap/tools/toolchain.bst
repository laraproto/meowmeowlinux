kind: stack
description: The buildsystem used to build most of the things in pkgs/

depends:
- bootstrap/pkgs/linux-headers.bst
- bootstrap/pkgs/glibc.bst
- bootstrap/pkgs/gcc.bst
- bootstrap/pkgs/binutils.bst

- bootstrap/tools/import-fdo.bst
