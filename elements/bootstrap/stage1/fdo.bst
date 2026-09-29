kind: junction

sources:
  - kind: git
    url: gitlab:freedesktop-sdk/freedesktop-sdk.git
    checkout-submodules: false
    track: release/26.08

config:
  options:
    target_arch: x86_64
