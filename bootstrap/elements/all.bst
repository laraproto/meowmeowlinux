kind: stack
description: List of packages to pull into bootstrap

depends:
# GNU Triplet
- pkgs/linux-api-headers.bst
- pkgs/glibc.bst
- pkgs/gcc.bst
- pkgs/binutils.bst

# Build tools
- pkgs/m4.bst
- pkgs/make.bst
- pkgs/bison.bst
- pkgs/flex.bst
- pkgs/gettext.bst
- pkgs/autoconf.bst
- pkgs/autoconf-archive.bst
- pkgs/automake.bst
- pkgs/libtool.bst
- pkgs/pkg-config.bst

# Debuginfo stripping
- pkgs/debugedit.bst

# Other utilities
- pkgs/coreutils.bst
- pkgs/bash.bst
- pkgs/ncurses.bst
- pkgs/gawk.bst
- pkgs/perl.bst
- pkgs/python.bst
- pkgs/diffutils.bst
- pkgs/file.bst
- pkgs/findutils.bst
- pkgs/gawk.bst
- pkgs/grep.bst
- pkgs/sed.bst
- pkgs/gzip.bst
- pkgs/tar.bst
