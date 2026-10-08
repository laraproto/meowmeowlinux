kind: meson

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: gnome-git:GNOME/glib
    track: "*.*.*"
  - kind: git_module
    path: subprojects/gvdb
    url: gnome-git:GNOME/gvdb

build-depends:
  - pkgs/meson.bst
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - bootstrap/stage1/glib.bst
  - bootstrap/stage1/pkg-config.bst
  - pkgs/glibc.bst
  - pkgs/gcc.bst
  - pkgs/zstd.bst
  - pkgs/cmake.bst
  - pkgs/libffi.bst

depends:
  - pkgs/zlib.bst
  - pkgs/pcre2.bst

variables:
  meson-local: -Dselinux=disabled # TODO

environment:
  ZLIB_LIBS: ""
  ZLIB_CFLAGS: ""
