kind: autotools

sources:
- kind: git_tag
  url: github:python/cpython.git
  track: '3.10'
  exclude:
  - v*rc*
  - v*a*
# release-monitoring: 13254

depends:
- pkgs/ncurses.bst

build-depends:
- tools/toolchain.bst

variables:
  conf-local: >-
    --without-ensurepip

config:
  configure-commands: # Python hardcodes /usr. Fix that
    (<):
    - sed -i '/def add_multiarch_paths/a \        return' setup.py
