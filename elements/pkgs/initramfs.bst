kind: manual

build-depends:
  - filename:
      - groups/initramfs.bst
    config:
      location: /initrd
  - pkgs/findutils.bst
  - pkgs/cpio.bst
  - groups/minimum.bst
  - pkgs/zstd.bst

sources:
  - kind: local
    path: files/create-temp-overlay.sh
  - kind: local
    path: files/create-temp-overlay.service

config:
  configure-commands:
    - |
      mkdir -pv sys
      mkdir -pv proc
      mkdir -pv dev
      mkdir -pv run
      mkdir -pv etc
      ln -sv usr/lib lib
      ln -sv usr/lib lib64
      ln -sv usr/bin bin
      ln -sv usr/bin sbin
      mkdir -pv sysroot
  build-commands:
    - |
      cp -rav /initrd/usr usr
    - |
      mv create-temp-overlay.sh usr/lib
      mv create-temp-overlay.service usr/lib/systemd/system
      mkdir -pv usr/lib/systemd/system/initrd-switch-root.target.wants
      ln -sv usr/lib/systemd/system/create-temp-overlay.service usr/lib/systemd/system/initrd-switch-root.target.wants/create-temp-overlay.service 
    - |
      # Trim the fat
      rm -r usr/share/man
      rm -r usr/share/doc
      rm -r usr/include
      rm -r usr/lib/locale
    - |
      ln -sv usr/bin/init init
    - |
      mv usr/lib/os-release usr/lib/initrd-release
      ln -sv ../usr/lib/initrd-release etc/initrd-release
    - |
      # Remove misc junk that does *NOT* need to be in the initramfs
      rm -v usr/lib/*.a
      rm -v usr/bin/systemd-{nspawn,vmspawn,sysext}
      rm -v usr/bin/{resolvectl,machinectl}
      rm -v usr/lib/systemd/systemd-{resolved,networkd,sysupdate,sysupdated,machined,portabled}
  install-commands:
    - |
      mkdir -pv %{install-root}/boot
      find . | cpio --create --verbose --format=newc > %{install-root}/boot/initramfs
      zstd %{install-root}/boot/initramfs -12
