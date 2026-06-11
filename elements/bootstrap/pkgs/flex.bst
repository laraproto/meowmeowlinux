kind: autotools

sources:
- kind: tar # Flex depends on itself. Need to use the tarball to build it
  url: github:westes/flex/files/981163/flex-2.6.4.tar.gz
# release-monitoring: 819

depends:
- bootstrap/pkgs/stage1/glibc.bst

build-depends:
- bootstrap/tools/toolchain.bst

config:
  install-commands:
    (>):
    - ln -sv flex %{install-root}/usr/bin/lex

(@):
  - elements/bootstrap/include/common.yml
