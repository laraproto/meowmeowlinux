kind: script
description: |
  Installs a compatability symlink for the sysroot

  See: http://www.linuxfromscratch.org/lfs/view/stable-systemd/chapter04/creatingtoolsdir.html

build-depends:
- tools/import-fdo.bst

config:
  commands:
  - |
    mkdir -pv %{install-root}%{bootstrap-sysroot}
    ln -sv %{prefix} %{install-root}%{bootstrap-sysroot}%{prefix}
