kind: autotools

sources:
  - kind: git_repo
    url: sourceware:elfutils
    track: elfutils-*.*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/gettext.bst
  - pkgs/tar.bst
  - pkgs/gzip.bst
  - pkgs/findutils.bst
  - pkgs/zstd.bst
  - pkgs/bzip2.bst
  - pkgs/pkgconf.bst
  - pkgs/flex.bst
  - pkgs/bison.bst

depends:
  - pkgs/bzip2.bst

variables:
  conf-local: --enable-maintainer-mode --enable-deterministic
