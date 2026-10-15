kind: meson

sources:
  - kind: git_repo
    url: fdo-git:mesa/mesa
    track: mesa-*.*.*

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/rust.bst
  - pkgs/rust-bindgen.bst
  - groups/python.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/python/mako.bst
  - pkgs/expat.bst
  - pkgs/python/pyyaml.bst
  - pkgs/libxcb.bst
  - pkgs/make.bst
  - pkgs/libdrm.bst
  - pkgs/llvm.bst
  - pkgs/wayland-protocols.bst
  - pkgs/glslang.bst
  - pkgs/libva.bst
  - pkgs/vulkan-loader.bst
  - pkgs/spirv-llvm-translator.bst
  - pkgs/libx11.bst

variables:
  meson-local: >-
    -D platforms=x11,wayland
    -D valgrind=disabled
    -D gallium-drivers=auto
    -D vulkan-drivers=auto
    -D video-codecs=all_free
