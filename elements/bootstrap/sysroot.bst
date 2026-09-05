kind: script

build-depends:
- bootstrap/base.bst

config:
  commands:
  - |
    mkdir -pv %{install-root}%{bootstrap-sysroot}
    ln -sv %{bootstrap-prefix} %{install-root}%{bootstrap-sysroot}%{bootstrap-prefix}
