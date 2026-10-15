kind: autotools

sources:
  - kind: gnu
    name: groff

build-depends:
  - groups/autotools.bst
  - pkgs/texinfo.bst

depends:
  - pkgs/perl.bst

config:
  build-commands:
    (<):
      # This is a workaround for a bug with parallel builds.
      - |
        cd "%{build-dir}"
        make -j1 arch/misc

  install-commands:
    (>):
      - |
        rm "%{install-root}%{infodir}/dir"
