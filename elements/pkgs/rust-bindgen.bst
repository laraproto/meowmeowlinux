kind: manual

sources:
  - kind: git_repo
    url: github:rust-lang/rust-bindgen
    track: v*.*.*
    exclude:
      - "*-*"
  - kind: cargo2
    url: "cargo:"
    git-mirrors:
      https://github.com/: "github:"

build-depends:
  - groups/autotools.bst
  - pkgs/rust.bst

config:
  build-commands:
    - |
      cargo build --release --bins --frozen
