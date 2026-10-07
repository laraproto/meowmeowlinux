kind: meson

sources:
  - kind: git_repo
    url: fdo-git:pkg-config/pkg-config
    track: "pkg-config-*"

build-depends:
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - pkgs/glibc.bst
  - pkgs/gcc.bst
  - pkgs/zstd.bst

depends:
  - pkgs/glib.bst

environment:
  GLIB_LIBS: /usr/lib
  GLIB_CFLAGS: ""
