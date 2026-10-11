kind: autotools

sources:
  - kind: git_repo
    url: github:dracut-ng/dracut
    track: "[0-9]*"

build-depends:
  - groups/autotools.bst
  - pkgs/systemd.bst
  - pkgs/asciidoctor.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/kmod.bst

runtime-depends:
  - pkgs/gawk.bst
  - pkgs/cpio.bst

config:
  configure-commands:
    - |
      ./configure
  build-commands:
    - |
      make %{make-args}
  install-commands:
    - |
      make DESTDIR=%{install-root} install
