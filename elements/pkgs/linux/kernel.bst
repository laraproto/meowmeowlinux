kind: manual
description: Linux kernel

sources:
  - kind: git_repo
    url: kernel:linux/kernel/git/stable/linux.git
    track: linux-rolling-stable
  - kind: local
    path: files/linux-config

build-depends:
  - groups/autotools.bst
  - pkgs/findutils.bst
  - pkgs/diffutils.bst
  - pkgs/flex.bst
  - pkgs/m4.bst
  - pkgs/bison.bst
  - pkgs/bc.bst
  - pkgs/elfutils.bst
  - pkgs/openssl3.bst
  - pkgs/gzip.bst

depends:
  - pkgs/linux/headers.bst
  - pkgs/depmod.bst

environment:
  INSTALL_MOD_PATH: /buildstream-install

config:
  configure-commands:
    - |
      make mrproper
      cp linux-config .config
  build-commands:
    - make
  install-commands:
    - |
      mkdir -pv %{install-root}/usr
      make DESTDIR=%{install-root}/usr modules_install
    - |
      mkdir %{install-root}/boot
      cp linux-config %{install-root}/boot/config
      cp System.map %{install-root}/boot/System.map
      cp arch/x86/boot/bzImage %{install-root}/boot/vmlinuz
    - |
      mkdir -p %{install-root}/usr/share/doc/
      cp -r Documentation %{install-root}/usr/share/doc/linux
