kind: autotools

(@):
  - elements/bootstrap/include/common.yml

sources:
- kind: git_tag
  url: tukaani:xz.git
  track: v5.8
  track-extra:
  - v5.8
  exclude:
  - v*alpha
  - v*beta
# release-monitoring: 5277

depends:
- bootstrap/pkgs/stage1/glibc.bst

build-depends:
- bootstrap/pkgs/gettext.bst
- bootstrap/pkgs/sed.bst
- bootstrap/pkgs/grep.bst
- bootstrap/tools/toolchain.bst

variables:
  autogen: ./autogen.sh --no-po4a
