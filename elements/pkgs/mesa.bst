kind: meson

sources:
  - kind: git_repo
    url: fdo-git:mesa/mesa
    track: mesa-*.*.*

depends:
  - pkgs/libxcb.bst
  - pkgs/make.bst
  - pkgs/python/pyyaml.bst
  - pkgs/libdrm.bst
  - pkgs/llvm.bst
  - pkgs/wayland-protocols.bst
  - pkgs/glslang.bst
  - pkgs/libva.bst
  - pkgs/vulkan-loader.bst
  - pkgs/spirv-llvm-translator.bst

variables:
  meson-local: >-
    -D platforms=wayland
    -D valgrind=disabled
    -D gallium-drivers=auto
    -D vulkan-drivers=auto
    -D video-codecs=all-free
