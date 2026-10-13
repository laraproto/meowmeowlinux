kind: meson

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: git_repo
    url: gnome-git:GNOME/glib
    track: "*.*.*"
  - kind: git_module
    path: subprojects/gvdb
    url: gnome-git:GNOME/gvdb

build-depends:
  - bootstrap/stage1/bash.bst
  - bootstrap/stage1/make.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/coreutils.bst
  - bootstrap/stage1/sed.bst
  - bootstrap/stage1/grep.bst
  - bootstrap/stage1/fdo.bst:public-stacks/buildsystem-meson.bst

depends:
  - bootstrap/stage1/zlib.bst
  - bootstrap/stage1/pcre2.bst
  - bootstrap/stage1/libffi.bst

variables:
  meson-local: -Dselinux=disabled

