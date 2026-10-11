kind: manual

sources:
- kind: tar
  url: rust:rust-1.99.0-x86_64-unknown-linux-gnu.tar.xz

build-depends:
- pkgs/grep.bst
- pkgs/sed.bst
- groups/minimum.bst

config:
  install-commands:
  - |
    bash install.sh \
      --prefix="%{prefix}" \
      --destdir="%{install-root}" \
      --disable-ldconfig
