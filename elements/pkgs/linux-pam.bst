kind: meson

sources:
  - kind: git_repo
    url: github:linux-pam/linux-pam
    track: "v*.*.*"

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/bison.bst
  - pkgs/flex.bst
  - pkgs/pkgconf.bst
