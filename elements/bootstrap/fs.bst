kind: manual

config:
  install-commands:
    - |
      mkdir -p %{install-root}/%{bootstrap}/usr/{bin,lib,share,include}
    - |
      ln -s usr/lib %{install-root}/${bootstrap}/{lib,lib64}
      ln -s usr/bin %{install-root}/${bootstrap}/{bin,sbin}
    - |
      ln -s bin %{install-root}/${bootstrap}/sbin
      ln -s lib %{install-root}/${bootstrap}/lib64
