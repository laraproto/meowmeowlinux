kind: make

sources:
  - kind: git_repo
    url: github:unicode-org/icu
    track: release-*.*
    exclude:
      - release-*-*
      - release-*rc
      - release-*rc*

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/python.bst

config:
  configure-commands: 
    - |
      ./icu4c/source/configure
  build-commands:
    - |
      make %{make-args}
  install-commands:
    - |
      make DESTDIR=%{install-root} install
