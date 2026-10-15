kind: cargo

sources:
  - kind: git_repo
    url: fdo-git:mtoeckl/waypipe
    track: v*.*.*

build-depends:
  - pkgs/rust.bst
  - pkgs/rust-bindgen.bst
  - groups/autotools.bst

depends:
  - pkgs/wayland.bst
  - pkgs/vulkan-loader.bst
  - pkgs/mesa.bst
  - pkgs/ffmpeg.bst

runtime-depends:
  - pkgs/openssh.bst
