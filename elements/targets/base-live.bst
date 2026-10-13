kind: manual

sources:
  - kind: local
    path: files/iso-repart.d
    directory: repart.d

build-depends:
  - filename: targets/base.bst
    config:
      location: /sysroot
  - groups/minimum.bst
  - pkgs/systemd.bst
  - pkgs/gcc.bst
  - pkgs/temp.bst
  - pkgs/alus.bst
  - pkgs/dosfstools.bst
  - pkgs/mtools.bst
  - pkgs/erofs-utils.bst

config:
  build-commands:
    - |
      systemd-repart --definitions=repart.d %{install-root}/base-live.iso --el-torito=yes --empty=create --size=auto --split=true --offline=true --sector-size=512 --copy-source=/sysroot
