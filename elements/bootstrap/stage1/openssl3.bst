kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:openssl/openssl
    track: openssl-3.*.*
    exclude:
    - openssl-*-*

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/autoconf.bst
  - bootstrap/env.bst

depends:
  - bootstrap/stage1/glibc.bst

config:
  configure-commands:
    - |
      mkdir build -pv
      cd build
      ../Configure --prefix=%{prefix} --libdir=lib
