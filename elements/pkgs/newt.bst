kind: autotools

sources:
  - kind: git_repo
    url: pagure:newt.git
    # This is the latest tag, and will *NEVER* change as pagure is R/O.
    track: r0-52-25

depends:
  - pkgs/popt.bst
  - pkgs/slang.bst

runtime-depends:
  - pkgs/gpm.bst

variables:
  conf-local: --with-gpm-support
