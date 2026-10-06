# Modified from Freedesktop

kind: manual

(@):
  - elements/bootstrap/stage1/common.yml

build-depends:
- bootstrap/stage1/grep.bst
- bootstrap/stage1/sed.bst
- bootstrap/stage1/coreutils.bst
- bootstrap/stage1/independent.bst

config:
  install-commands:
  - |
    bash install.sh \
      --prefix="%{prefix}" \
      --destdir="%{install-root}" \
      --disable-ldconfig

sources:
- kind: tar
  url: rust:rust-1.99.0-x86_64-unknown-linux-gnu.tar.xz
