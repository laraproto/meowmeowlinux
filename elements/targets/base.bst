kind: stack

depends:
  # Bare Base
  - groups/minimum.bst
  - pkgs/systemd.bst
  - pkgs/dbus.bst
  - pkgs/dbus-broker.bst
  - pkgs/alus.bst
  - pkgs/uki.bst
  - pkgs/linux/kernel.bst
  - pkgs/shadow.bst
  - pkgs/mesa.bst
  - pkgs/tzdata.bst

  # Filesystems
  - pkgs/btrfs-progs.bst
  - pkgs/dosfstools.bst
  - pkgs/mtools.bst
  - pkgs/erofs-utils.bst

  # Utils
  - pkgs/openssh.bst
  - pkgs/sudo.bst
  - pkgs/kmod.bst
  - pkgs/fastfetch.bst
  - pkgs/man-db.bst
  - pkgs/man-pages.bst
  - pkgs/less.bst
