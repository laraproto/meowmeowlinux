kind: cargo

sources:
  - kind: git_repo
    url: github:mozilla/cbindgen.git
    track: v*
  - kind: cargo
    url: "cargo:"

build-depends:
  - groups/autotools.bst
  - pkgs/rust.bst
