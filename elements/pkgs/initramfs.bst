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

depends:
  - groups/minimum.bst

config:
  configure-commands:
    - |
      mkdir -pv sys
      mkdir -pv proc
      mkdir -pv dev
      mkdir -pv run
      mkdir -pv lib
      mkdir -pv lib64
      mkdir -pv sysroot
  build-commands:
    - |
      cp -rav /initrd/usr usr
  install-commands:
    - |
      mkdir -pv boot
      find . | cpio --create --verbose > boot/initramfs.img
