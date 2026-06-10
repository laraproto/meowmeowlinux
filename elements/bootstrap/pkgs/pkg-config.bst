kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: git_tag
  url: github:pkgconf/pkgconf
  track: pkgconf-2.5.1

build-depends:
- bootstrap/tools/toolchain.bst

variables:
  bootstrap-pconf-dirs: "%{libdir}/pkgconfig:%{datadir}/pkgconfig"
  system-pconf-dirs: "/usr/lib/pkgconfig:/usr/share/pkgconfig"
  conf-local: >-
    --with-pkg-config-dir=%{system-pconf-dirs}:%{bootstrap-pconf-dirs}

config:
  install-commands:
    (>):
    - ln -sv pkgconf %{install-root}%{bindir}/pkg-config
