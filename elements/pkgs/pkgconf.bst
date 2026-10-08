kind: meson

sources:
  - kind: git_repo
    url: github:pkgconf/pkgconf
    track: "pkgconf-*.*.*"

build-depends:
  - groups/autotools.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/zstd.bst
  - pkgs/meson.bst

config:
  install-commands:
    (>):
      - |
        ln -sf pkgconf %{install-root}/usr/bin/pkg-config
