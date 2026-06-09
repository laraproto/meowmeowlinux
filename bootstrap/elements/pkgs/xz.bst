kind: autotools

sources:
- kind: git_tag
  url: tukaani:xz.git
  track-extra:
  - v5.2
  exclude:
  - v*alpha
  - v*beta
# release-monitoring: 5277

depends:
- pkgs/glibc.bst

build-depends:
- pkgs/gettext.bst
- pkgs/sed.bst
- pkgs/grep.bst
- tools/toolchain.bst

variables:
  autogen: ./autogen.sh --no-po4a
