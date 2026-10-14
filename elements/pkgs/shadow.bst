kind: autotools

sources:
  - kind: git_repo
    url: github:shadow-maint/shadow
    track: 4.*.*
    exclude:
      - r*rc*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/gettext.bst
  - pkgs/tar.bst
  - pkgs/findutils.bst
  - pkgs/gzip.bst
  - pkgs/libtool.bst
  - pkgs/pkgconf.bst
  - pkgs/libxslt.bst
  - pkgs/libxcrypt.bst
  - pkgs/libcap-ng.bst

depends:
  - pkgs/btrfs-progs.bst
  - pkgs/libaudit.bst
  - pkgs/acl.bst

variables:
  conf-local: >-
    --without-libbsd
    --without-su
    --with-libpam
    --with-audit
    --disable-account-tools-setuid
  autogen: autoreconf -fvi

config:
  install-commands:
    (>):
      - |
        mv %{install-root}/usr/sbin/* %{install-root}/usr/bin/
        rmdir %{install-root}/usr/sbin
      - |
        rm %{install-root}/usr/bin/newgrp
        rm %{install-root}/usr/bin/nologin
        rm %{install-root}/usr/bin/vigr
        rm %{install-root}/usr/bin/vipw
