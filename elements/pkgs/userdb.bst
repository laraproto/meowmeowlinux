kind: manual

sources:
  - kind: local
    path: files/userdb

build-depends:
  - groups/minimum.bst

config:
  install-commands:
    - |
      mkdir -pv %{install-root}%{libdir}/userdb/
      mv * %{install-root}%{libdir}/userdb/

environment:
  PATH: "%{bindir}"
  LD_LIBRARY_PATH: "%{libdir}"
