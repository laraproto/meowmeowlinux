kind: autotools

sources:
- kind: tar # Flex depends on itself. Need to use the tarball to build it
  url: github:westes/flex/files/981163/flex-2.6.4.tar.gz
# release-monitoring: 819

depends:
- pkgs/glibc.bst

build-depends:
- tools/toolchain.bst

config:
  install-commands:
    (>):
    - ln -sv flex %{install-root}%{bindir}/lex
