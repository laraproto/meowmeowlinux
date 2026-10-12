kind: cmake

sources:
  - kind: git_repo
    url: github:yubico/libfido2.git
    track: "*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/cmake.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libcbor.bst
  - pkgs/openssl3.bst
  - pkgs/zlib.bst
  - pkgs/systemd.bst
