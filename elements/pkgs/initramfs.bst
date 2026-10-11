kind: manual

sources:
  - kind: local
    path: files/initrd.conf

build-depends:
  - filename:
      - groups/initramfs.bst
    config:
      location: /initrd
  - pkgs/findutils.bst
  - pkgs/cpio.bst
  - groups/minimum.bst
  - pkgs/zstd.bst

config:
  configure-commands:
    - |
      mkdir -pv sys
      mkdir -pv proc
      mkdir -pv dev
      mkdir -pv run
      ln -sv usr/lib lib
      ln -sv usr/lib lib64
      ln -sv usr/bin bin
      ln -sv usr/bin sbin
      mkdir -pv sysroot
  build-commands:
    - |
      cp -rav /initrd/usr usr
    - |
      # Trim the fat
      rm -r usr/share/man
      rm -r usr/share/doc
      rm -r usr/include
      rm -r usr/lib/locale
    - |
      ln -sv usr/bin/init init
  install-commands:
    - |
      mkdir -pv %{install-root}/boot
      find . | cpio --create --verbose --format=newc > %{install-root}/boot/initramfs
      zstd %{install-root}/boot/initramfs -18
