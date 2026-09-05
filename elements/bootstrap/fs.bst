kind: manual

build-depends:
- bootstrap/fdo.bst

config:
  install-commands:
    - |
        mkdir -v %{install-root}/bin
        mkdir -pv %{install-root}/usr/bin
        mkdir -v %{install-root}/usr/lib

        for tool in bash cat pwd; do
          ln -sfv %{bindir}/$tool %{install-root}/bin/$tool
        done
        ln -sfv %{bindir}/bash %{install-root}/bin/sh

        for tool in env perl printf m4 bash; do
          ln -sfv %{bindir}/$tool %{install-root}/usr/bin/$tool
        done

        ln -sfv %{libdir}/libgcc_s.so{,.1} %{install-root}/usr/lib
        ln -sfv %{libdir}/libstdc++.{a,so{,.6}} %{install-root}/usr/lib
