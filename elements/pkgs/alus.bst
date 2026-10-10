kind: manual

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git
    url: github:taxrosdev/alus
    track: main
  - kind: local
    path: files/hooks
  - kind: cargo2
    url: "cargo:"

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
      mv -pv hooks %{install-root}/usr/share/alus/hooks

environment:
  LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"
  LD_LIBRARY_PATH: "/tools/lib:/tools/lib64:/usr/lib"

