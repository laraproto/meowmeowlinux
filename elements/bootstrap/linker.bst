kind: manual

(@):
  - elements/bootstrap/use.yml

config:
  install-commands:
    - mkdir -pv %{install-root}/lib64
    - ln -sv /tools/lib/ld-linux-x86-64.so.2 %{install-root}/lib64/ld-linux-x86-64.so.2
