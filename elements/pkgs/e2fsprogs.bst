kind: autotools

sources:
  - kind: git_repo
    url: kernel:fs/ext2/e2fsprogs.git
    track: v*
    exclude:
      - v*rc*

build-depends:
  - groups/autotools.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/util-linux.bst

variables:
  conf-local: >-
    --enable-elf-shlibs
    --disable-fsck
    --disable-uuidd
    --disable-libblkid
