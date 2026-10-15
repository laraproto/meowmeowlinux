kind: make

sources:
  - kind: git_repo
    url: github:eggert/tz.git
    track: 20*
    version-guess-pattern: '^\d{4}[a-z]'

build-depends:
  - groups/autotools.bst

variables:
  make-args: >-
    PREFIX="%{prefix}" CC=gcc ZFLAGS='-b fat'

config:
  install-commands:
    (>):
      # We're really only interested in the timezone data
      - |
        rm -rf "%{install-root}%{bindir}"
      - |
        rm -rf "%{install-root}/etc"
      - |
        rm -rf "%{install-root}%{libdir}"
      - |
        rm -rf "%{install-root}%{prefix}/sbin"

      # Man pages are provided by Linux's man-pages
      # sdk/elements/components/man-pages.bst
      - |
        rm -rf "%{install-root}%{mandir}"

      # Set up a default timezone, for when Flatpak can't use the host one
      - |
        mkdir -p "%{install-root}%{sysconfdir}"
      - |
        ln -sf "%{datadir}/zoneinfo/UTC" "%{install-root}%{sysconfdir}/localtime"
