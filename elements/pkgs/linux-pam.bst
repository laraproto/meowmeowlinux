kind: meson

sources:
  - kind: git_repo
    url: github:linux-pam/linux-pam
    track: "v*.*.*"

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
