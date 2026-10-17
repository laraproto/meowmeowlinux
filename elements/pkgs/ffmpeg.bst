kind: cmake

sources:
  - kind: tar
    url: ffmpeg:ffmpeg-9.0.2.tar.xz

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/nasm.bst
  - pkgs/alsa-lib.bst
  - pkgs/harfbuzz.bst
  - pkgs/opus.bst
  - pkgs/libva.bst
  - pkgs/libdrm.bst
  - pkgs/openssl3.bst
  - pkgs/nasm.bst

config:
  configure-commands:
    - |
      ./configure %{conf-local}

variables:
  conf-local: >-
    --enable-gpl
    --enable-version3
    --disable-debug
    --enable-libfreetype
    --enable-libdrm
    --enable-openssl
