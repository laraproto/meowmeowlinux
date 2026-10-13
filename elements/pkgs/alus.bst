kind: manual

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git
    url: github:taxrosdev/alus
    track: main
  - kind: local
    path: files/hooks
    directory: hooks
  - kind: cargo2
    url: "cargo:"
    git-mirrors:
      https://github.com/: "github:"
    ref:
      - kind: git
        commit: 63e35726037c08a25543105cf8f3faf19ff1465a
        repo: github:taxrosdev/treeup
        name: treeup
        version: 0.1.0
      - kind: git
        commit: 63e35726037c08a25543105cf8f3faf19ff1465a
        repo: github:taxrosdev/treeup
        name: treeup-core
        version: 0.1.0

build-depends:
  - bootstrap/stage1/rust.bst
  - groups/minimum.bst
  - pkgs/gcc.bst

depends:
  - pkgs/openssl3.bst

config:
  build-commands:
    - |
      cargo build --release --bins --frozen
  install-commands:
    - |
      mkdir -pv %{install-root}/usr/bin
      mv ./target/release/alus %{install-root}/usr/bin/alus
      mv ./target/release/alus-initramfs %{install-root}/usr/bin/alus-initramfs
    - |
      mkdir -pv %{install-root}/usr/share/alus/
      mv -v hooks %{install-root}/usr/share/alus/hooks
