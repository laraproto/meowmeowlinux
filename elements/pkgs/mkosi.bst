kind: manual

sources:
  - kind: git_repo
    url: github:systemd/mkosi
    track: v*

depends:
  - groups/minimum.bst
  - pkgs/python.bst

config:
  build-commands:
    - |
      python -m build --wheel --no-isolation
  install-commands:
    - |
      mkdir -pv %{install-root}/usr/bin
      mv bin/mkosi %{install-root}/usr/bin/
      mv bin/mkosi-addon %{install-root}/usr/bin/
      mv bin/mkosi-initrd %{install-root}/usr/bin/
      mv bin/mkosi-sandbox %{install-root}/usr/bin/
    - |
      mkdir -pv %{install-root}/usr/share/man/man1/
      mv mkosi/resources/man/* %{install-root}/usr/share/man/man1/

