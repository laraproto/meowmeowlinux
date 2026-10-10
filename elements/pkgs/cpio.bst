kind: autotools

sources:
  - kind: gnu
    name: cpio
  - kind: patch
    path: patches/cpio/fix-c23-conformity.patch

build-depends:
  - groups/autotools.bst
  - pkgs/m4.bst
  - pkgs/automake.bst
  - pkgs/findutils.bst
  - pkgs/gettext.bst
  - pkgs/gzip.bst
  - pkgs/texinfo.bst

depends:
  - pkgs/git.bst
  - pkgs/rsync.bst
  - pkgs/wget.bst
  - pkgs/tar.bst

variables:
  conf-local: >-
    --with-rmt="%{libexecdir}/rmt"

config:
  install-commands:
    (>):
      - |
        rm %{install-root}/usr/share/info/dir
