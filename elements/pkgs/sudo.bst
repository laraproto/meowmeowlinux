kind: autotools

sources:
  - kind: git_repo
    url: github:sudo-project/sudo
    track: v1.*.*
  - kind: local
    path: files/sudo.conf

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/openssl3.bst
  - pkgs/libaudit.bst
  - pkgs/linux-pam.bst

variables:
  conf-local: --with-env-editor --with-all-insults

config:
  install-commands:
    (>):
      - |
        mkdir -pv %{install-root}/etc/sudoers.d
        cp sudo.conf %{install-root}/etc/sudoers.d/00-meowmeowlinux

