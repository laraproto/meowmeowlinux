kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: git_repo
    url: github:ThomasDickey/ncurses-snapshots.git
    track: "v*"
    exclude:
      - "v*_*_*"

build-depends:
  - bootstrap/stage1/base.bst

variables:
  conf-local: --with-shared
    --without-normal
    --without-debug
    --with-termlib
    --without-ada
    --disable-stripping
    AWK=gawk

config:
  install-commands:
    - |
      %{make-install}
    - |
      ln -sv libncursesw.so %{install-root}/tools/lib/libtinfo.so
      ln -sv libncursesw.so.6 %{install-root}/tools/lib/libtinfo.so.6
      ln -sv libncursesw.so %{install-root}/tools/lib/libtic.so
      ln -sv libncursesw.so.6 %{install-root}/tools/lib/libtic.so.6
