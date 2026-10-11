kind: cargo

sources:
  - kind: git_repo
    url: github:rust-lang/rust-bindgen
    track: v*.*.*
    exclude:
      - "*-*"
  - kind: cargo
    url: "cargo:"

build-depends:
  - groups/autotools.bst
  - pkgs/rust.bst

variables:
  cargo-install-flags: >-
    %{cargo-install-global}
    %{cargo-install-local}
    --frozen
    --path bindgen-cli
    --root '%{install-root}%{prefix}'
