kind: autotools

sources:
  - kind: git_repo
    url: github:gwsw/less.git
    track: v*-rel

build-depends:
  - groups/autotools.bst
  - pkgs/groff.bst

depends:
  - pkgs/ncurses.bst

variables:
  # https://github.com/gwsw/less/blob/v661-rel/README#L35
  autogen: make -f Makefile.aut distfiles
