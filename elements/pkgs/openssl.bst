kind: make

sources:
  - kind: git_repo
    url: github:openssl/openssl
    track: openssl-*.*.*
    exclude:
    - openssl-*-*

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/glibc.bst

config:
  configure-commands:
    - |
      ./Configure --prefix=%{prefix} --libdir=lib
