kind: meson

sources:
  - kind: git_repo
    url: gnome-git:GNOME/glib
    track: "*.*.*"

build-depends:
  - pkgs/meson.bst
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - bootstrap/stage1/glib.bst
  - pkgs/glibc.bst
  - pkgs/gcc.bst
  - pkgs/zstd.bst
  - pkgs/cmake.bst

depends:
  - pkgs/zlib.bst
  - pkgs/pcre2.bst

environment:
  ZLIB_LIBS: /usr/lib
  ZLIB_CFLAGS: ""
