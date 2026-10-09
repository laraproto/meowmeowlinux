kind: manual

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: tar
    url: rust:rustc-1.99.0-src.tar.xz
  - kind: local
    path: files/rust-config.toml

build-depends:
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/git.bst
  - pkgs/curl.bst
  - groups/minimum.bst

depends:
  - pkgs/llvm.bst
  - pkgs/python.bst

config:
  configure-commands:
    - |
      mv rust-config.toml config.toml
      ./configure --enable-full-tools --set install.prefix=%{prefix} --set install.sysconfdir=%{sysconfdir}
  build-commands:
    - |
      ./x.py build
  install-commands:
    - |
      export DESTDIR=%{install-root}
      ./x.py install
