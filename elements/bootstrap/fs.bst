kind: manual

build-depends:
  - bootstrap/base.bst

config:
  install-commands:
    - |
      mkdir -pv %{install-root}/usr/{lib,bin,share,include}

      # Usr Merge
      ln -s lib %{install-root}/usr/lib64
      ln -s bin %{install-root}/usr/sbin

      # /usr/local should be R/W
      ln -s ../opt %{install-root}/usr/local

      # /.. -> /usr/..
      for i in bin lib sbin lib64; do
        ln -sv usr/$i $LFS/$i
      done
