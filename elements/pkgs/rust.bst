kind: manual

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:rust-lang/rust
    track: stable

build-depends:
  - bootstrap/stage1/independent.bst
  - bootstrap/stage1/git.bst
  - bootstrap/env.bst

depends:
  - bootstrap/stage1/llvm.bst
  - pkgs/python.bst # TODO: rename to bootstrap/stage1/python.bst when pkgs/python.bst is moved

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
