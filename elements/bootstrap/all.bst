kind: stack
description: List of packages to pull into bootstrap

(@):
  - elements/bootstrap/include/common.yml

depends:
# GNU Triplet
- bootstrap/pkgs/linux-headers.bst
- bootstrap/pkgs/glibc.bst
- bootstrap/pkgs/gcc.bst
- bootstrap/pkgs/binutils.bst

# Build tools
- bootstrap/pkgs/m4.bst
- bootstrap/pkgs/make.bst
- bootstrap/pkgs/bison.bst
- bootstrap/pkgs/flex.bst
- bootstrap/pkgs/gettext.bst
- bootstrap/pkgs/autoconf.bst
- bootstrap/pkgs/autoconf-archive.bst
- bootstrap/pkgs/automake.bst
- bootstrap/pkgs/libtool.bst
- bootstrap/pkgs/pkg-config.bst

# Debuginfo stripping
- bootstrap/pkgs/debugedit.bst

# Other utilities
- bootstrap/pkgs/coreutils.bst
- bootstrap/pkgs/bash.bst
- bootstrap/pkgs/ncurses.bst
- bootstrap/pkgs/gawk.bst
- bootstrap/pkgs/perl.bst
- bootstrap/pkgs/python.bst
- bootstrap/pkgs/diffutils.bst
- bootstrap/pkgs/file.bst
- bootstrap/pkgs/findutils.bst
- bootstrap/pkgs/gawk.bst
- bootstrap/pkgs/grep.bst
- bootstrap/pkgs/sed.bst
- bootstrap/pkgs/gzip.bst
- bootstrap/pkgs/tar.bst
