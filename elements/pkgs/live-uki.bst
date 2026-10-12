kind: manual

build-depends:
  - pkgs/systemd.bst
  - groups/minimum.bst
  - pkgs/initramfs.bst
  - pkgs/linux/kernel.bst
  - pkgs/python-pefile.bst

config:
  install-commands:
    - |
      mkdir -p %{install-root}/boot/EFI/Linux/
      ukify build --cmdline="liveboot" --output=%{install-root}/boot/EFI/Linux/meowmeowlinux-live.efi --linux=/boot/vmlinuz --initrd=/boot/initramfs.zst
