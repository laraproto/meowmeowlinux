kind: manual

sources:
  - kind: local
    path: files/os-release

build-depends:
  - groups/minimum.bst

config:
  configure-commands:
    - |
      mkdir -pv %{install-root}/usr/lib/os-release
      mv os-release %{install-root}/usr/lib/os-release

