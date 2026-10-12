kind: manual

build-depends:
  - groups/autotools.bst

config:
  configure-commands:
    - |
      mkdir -pv %{install-root}/var
      ln -sv /tmp %{install-root}/var/tmp
