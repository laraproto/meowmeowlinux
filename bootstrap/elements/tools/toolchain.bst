kind: stack
description: The buildsystem used to build most of the things in pkgs/

depends:
- pkgs/linux-api-headers.bst
- pkgs/glibc.bst
- pkgs/gcc.bst
- pkgs/binutils.bst

- tools/import-fdo.bst
- tools/sysroot-setup.bst
