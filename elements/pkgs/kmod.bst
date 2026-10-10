kind: meson

sources:
  - kind: git_repo
    url: github:kmod-project/kmod
    track: v*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst
  - pkgs/scdoc.bst

depends:
  - pkgs/zlib.bst
  - pkgs/zstd.bst
  - pkgs/openssl.bst
  - pkgs/xz.bst
