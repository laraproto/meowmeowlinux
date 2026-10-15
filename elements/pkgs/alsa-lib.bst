kind: autotools

sources:
  - kind: tar
    url: alsa:lib/alsa-lib-1.2.16.1.tar.bz2
  - kind: tar
    url: alsa:lib/alsa-ucm-conf-1.2.16.1.tar.bz2
    directory: conf

depends:
  - groups/autotools.bst

config:
  install-commands:
    (>):
      - |
        mkdir -pv %{install-root}/usr/share/alsa
        mv conf/* %{install-root}/usr/share/alsa/
