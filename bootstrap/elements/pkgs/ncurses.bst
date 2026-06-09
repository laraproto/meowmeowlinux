kind: autotools

sources:
- kind: gnu
  name: ncurses

build-depends:
- tools/toolchain.bst

variables:
  conf-local: >-
    --with-shared
    --without-debug
    --without-ada
    --enable-widec
    --enable-overwrite

config:
  configure-commands: # Don't use mawk
    (<):
    - sed -i s/mawk// configure
  install-commands: # Link libncursesw.so -> libncurses.so and libcurses.so
    (>):
    - ln -sv libncursesw.so %{install-root}%{libdir}/libncurses.so
