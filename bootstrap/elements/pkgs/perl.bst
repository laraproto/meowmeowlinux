kind: manual

sources:
- kind: git_tag
  url: github:perl/perl5.git
  track: maint-5.36
  match:
  - v5.*[02468].*
  exclude:
  - v*-RC*
# release-monitoring: 13599

build-depends:
- tools/toolchain.bst

config:
  configure-commands:
  - bash Configure -des -Dprefix=%{prefix} -Dlibs=-lm -Uloclibpth -Ulocincpth -Duseshrplib
  build-commands:
  - make
  install-commands:
  - make install.perl DESTDIR="%{install-root}"
