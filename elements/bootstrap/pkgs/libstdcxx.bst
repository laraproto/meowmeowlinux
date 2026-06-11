kind: autotools
description: A temporary libstdc++ used to build a final bootstrap gcc

(@):
  - elements/bootstrap/include/autotools-fix.yml

sources:
  - kind: gnu
    name: gcc

build-depends:
  - bootstrap/tools/import-fdo.bst
  - bootstrap/pkgs/stage1/gcc.bst
  - bootstrap/pkgs/stage1/binutils.bst
  - bootstrap/pkgs/glibc.bst
  - bootstrap/pkgs/linux-headers.bst

variables:
  conf-cmd: '%{build-root}/libstdc++-v3/configure'
  gcc-version: $(%{triplet}-gcc -dumpversion)
  conf-local: >-
    --host=%{triplet} --disable-multilib --disable-nls --disable-libstdcxx-pch
    --disable-multilib
    --with-gxx-include-dir=%{bootstrap-prefix}/%{triplet}/include/c++/%{gcc-version}}}

config:
  configure-commands:
    - |
      %{autogen}
    - |
      export CXXFLAGS="$CXXFLAGS -Wno-template-body"
      %{configure}
