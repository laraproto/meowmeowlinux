kind: autotools

(@):
  - elements/bootstrap/use.yml

sources:
  - kind: git_repo
    url: github:westes/flex
    track: v*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/gettext.bst
  - pkgs/libtool.bst
  - pkgs/tar.bst
  - pkgs/gzip.bst
  - pkgs/findutils.bst
  - pkgs/bison.bst
  - bootstrap/stage1/flex.bst
  - bootstrap/stage1/glibc.bst
  - pkgs/texinfo.bst
  - pkgs/help2man.bst

config:
  install-commands:
    (>):
      - |
        rm %{install-root}/usr/share/info/dir
