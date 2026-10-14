kind: manual

build-depends:
  - pkgs/systemd.bst
  - groups/minimum.bst
  - pkgs/initramfs.bst
  - pkgs/linux/kernel.bst
  - pkgs/python/pefile.bst
  - pkgs/python.bst
  
config:
  install-commands:
    - |
      mkdir -pv %{install-root}/boot/EFI/{BOOT,systemd,Linux}
    - |
      ukify build --cmdline="liveboot rw systemd.log_target=kmsg rd.systemd.log_target=kmsg" --output=%{install-root}/boot/EFI/Linux/meowmeowlinux-live.efi --linux=/boot/vmlinuz --initrd=/boot/initramfs.zst
    - |
      cp /usr/lib/systemd/boot/efi/systemd-bootx64.efi %{install-root}/boot/EFI/BOOT/BOOTX64.EFI
      cp /usr/lib/systemd/boot/efi/systemd-bootx64.efi %{install-root}/boot/EFI/systemd/systemd-bootx64.efi
