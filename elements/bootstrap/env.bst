kind: manual

build-depends:
  - bootstrap/stage1/independent.bst

depends:
  - bootstrap/stage1/coreutils.bst

environment:
  PATH: "/usr/bin:/tools/bin"
  LD_LIBRARY_PATH: "/usr/lib:/tools/lib"

config:
  install-commands:
    - mkdir -pv %{install-root}/bin
    - mkdir -pv %{install-root}/usr/bin
    - ln -sv /tools/bin/env %{install-root}/bin/env
    - ln -sv /tools/bin/env %{install-root}/usr/bin/env
