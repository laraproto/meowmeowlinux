kind: script

build-depends:
- all.bst

variables:
  install-root: /

config:
  commands:
  - | # Install ld-new
    mv -v /tools/bin/{ld,ld-old}
    mv -v /tools/x86_64-pc-linux-gnu/bin/{ld,ld-old}
    mv -v /tools/bin/{ld-new,ld}
    ln -sv /tools/bin/ld /tools/x86_64-pc-linux-gnu/bin/ld
  - | # Don't reference /tools in new binaries
    gcc -dumpspecs | sed \
      -e 's|/tools|/usr|g' \
      -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' \
      -e '/self_spec/!b;n;c -B /usr/lib' \
      > `dirname $(gcc --print-libgcc-file-name)`/specs
