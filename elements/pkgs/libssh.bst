kind: cmake

sources:
  - kind: git_repo
    url: libssh:libssh.git
    track: libssh-*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst

depends:
  - pkgs/openssl3.bst
