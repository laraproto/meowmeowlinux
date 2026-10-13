kind: meson

sources:
  - kind: git_repo
    url: github:intel/libva
    track: 2.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/libdrm.bst
  - pkgs/wayland.bst

# TODO
# runtime-depends:
#   - pkgs/intel-vaapi-driver.bst
#   - intel-media-driver.bst
