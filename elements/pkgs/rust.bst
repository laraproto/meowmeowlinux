kind: manual

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:rust-lang/rust
    track: stable

build-depends:
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/git.bst
  - groups/minimum.bst

depends:
  - pkgs/llvm.bst
  - pkgs/python.bst

config:
  configure-commands:
    - |
      ./configure --enable-full-tools --set install.prefix=%{prefix} --set install.sysconfdir=%{sysconfdir}
  build-commands:
    - |
      ./x.py build
  install-commands:
    - |
      export DESTDIR=%{install-root}
      ./x.py install
