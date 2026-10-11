kind: manual

sources:
  - kind: git_repo
    url: github:asciidoctor/asciidoctor
    track: v*.*.*

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/ruby.bst

variables:
  strip-binaries: ""

config:
  build-commands:
    - |
      gem build

  install-commands:
    - |
      gemdir=$(gem environment gemdir)
      gem install asciidoctor-*.gem --install-dir "%{install-root}${gemdir}"
      mkdir -p "%{install-root}%{bindir}"
      ln -sr "%{install-root}${gemdir}/bin/asciidoctor" "%{install-root}%{bindir}/asciidoctor"
