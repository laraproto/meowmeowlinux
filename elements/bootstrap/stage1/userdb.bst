kind: manual

(@):
  - elements/bootstrap/common.yml

sources:
  - kind: local
    path: files/userdb

build-depends:
  - bootstrap/stage1/independent.bst

depends:
  - bootstrap/stage1/systemd.bst

config:
  install-commands:
    - |
      mkdir -pv %{install-root}%{sysconfdir}/userdb/
      mv * %{install-root}%{sysconfdir}/userdb/
    - |
      systemd-sysusers --root=%{install-root}
