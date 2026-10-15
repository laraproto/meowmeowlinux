kind: meson

sources:
  - kind: git_repo
    url: fdo-git:mesa/mesa
    track: mesa-*.*.*
  - kind: tar
    directory: subprojects/packagecache/syn-2.0.87
    url: cargo:syn/syn-2.0.87.crate
  - kind: tar
    directory: subprojects/packagecache/unicode-ident-1.0.12
    url: cargo:unicode-ident/unicode-ident-1.0.12.crate
  - kind: tar
    directory: subprojects/packagecache/proc-macro2-1.0.86
    url: cargo:proc-macro2/proc-macro2-1.0.86.crate
  - kind: tar
    directory: subprojects/packagecache/quote-1.0.35
    url: cargo:quote/quote-1.0.35.crate
  - kind: tar
    directory: subprojects/packagecache/paste-1.0.14
    url: cargo:paste/paste-1.0.14.crate
  - kind: tar
    directory: subprojects/packagecache/roxmltree-0.20.0
    url: cargo:roxmltree/roxmltree-0.20.0.crate
  - kind: tar
    directory: subprojects/packagecache/equivalent-1.0.1
    url: cargo:equivalent/equivalent-1.0.1.crate
  - kind: tar
    directory: subprojects/packagecache/hashbrown-0.14.1
    url: cargo:hashbrown/hashbrown-0.14.1.crate
  - kind: tar
    directory: subprojects/packagecache/indexmap-2.2.6
    url: cargo:indexmap/indexmap-2.2.6.crate
  - kind: tar
    directory: subprojects/packagecache/once_cell-1.8.0
    url: cargo:once_cell/once_cell-1.8.0.crate
  - kind: tar
    directory: subprojects/packagecache/pest-2.7.11
    url: cargo:pest/pest-2.7.11.crate
  - kind: tar
    directory: subprojects/packagecache/pest_derive-2.7.11
    url: cargo:pest_derive/pest_derive-2.7.11.crate
  - kind: tar
    directory: subprojects/packagecache/pest_generator-2.7.11
    url: cargo:pest_generator/pest_generator-2.7.11.crate
  - kind: tar
    directory: subprojects/packagecache/pest_meta-2.7.11
    url: cargo:pest_meta/pest_meta-2.7.11.crate
  - kind: tar
    directory: subprojects/packagecache/ucd-trie-0.1.6
    url: cargo:ucd-trie/ucd-trie-0.1.6.crate
  - kind: tar
    directory: subprojects/packagecache/rustc-hash-2.1.1
    url: cargo:rustc-hash/rustc-hash-2.1.1.crate

build-depends:
  - pkgs/meson.bst
  - groups/autotools.bst
  - pkgs/rust.bst
  - pkgs/rust-bindgen.bst
  - pkgs/rust-cbindgen.bst
  - groups/python.bst
  - pkgs/bison.bst
  - pkgs/flex.bst
  - pkgs/pkgconf.bst

depends:
  - pkgs/python/mako.bst
  - pkgs/python/markupsafe.bst
  - pkgs/python/ply.bst
  - pkgs/python/pycparser.bst
  - pkgs/expat.bst
  - pkgs/python/pyyaml.bst
  - pkgs/libxcb.bst
  - pkgs/make.bst
  - pkgs/libdrm.bst
  - pkgs/elfutils.bst
  - pkgs/llvm.bst
  - pkgs/wayland-protocols.bst
  - pkgs/glslang.bst
  - pkgs/libva.bst
  - pkgs/vulkan-loader.bst
  - pkgs/spirv-llvm-translator.bst
  - groups/xorg.bst

variables:
  meson-local: >-
    -D platforms=x11,wayland
    -D valgrind=disabled
    -D gallium-drivers=auto
    -D vulkan-drivers=auto
    -D video-codecs=all_free
