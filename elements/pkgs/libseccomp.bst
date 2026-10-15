kind: autotools

sources:
  - kind: git_repo
    url: github:seccomp/libseccomp.git
    track: v*

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/autoconf.bst
  - pkgs/libtool.bst
  - pkgs/pkgconf.bst
  - pkgs/gperf.bst
