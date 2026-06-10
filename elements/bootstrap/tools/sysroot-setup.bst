kind: script
description: |
  Installs a compatability symlink for the sysroot

  See: http://www.linuxfromscratch.org/lfs/view/stable-systemd/chapter04/creatingtoolsdir.html

build-depends:
- bootstrap/tools/import-fdo.bst

config:
  commands:
  - |
    mkdir -pv %{install-root}%{bootstrap-sysroot}
    ln -sv %{bootstrap-prefix} %{install-root}%{bootstrap-sysroot}%{bootstrap-prefix}
