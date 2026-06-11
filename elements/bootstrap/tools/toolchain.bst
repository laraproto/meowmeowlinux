kind: stack
description: The buildsystem used to build most of the things in pkgs/

depends:
- bootstrap/pkgs/stage1/linux-api-headers.bst
- bootstrap/pkgs/stage1/glibc.bst
- bootstrap/pkgs/gcc.bst
- bootstrap/pkgs/binutils.bst

- bootstrap/tools/import-fdo.bst
- bootstrap/tools/sysroot-setup.bst
