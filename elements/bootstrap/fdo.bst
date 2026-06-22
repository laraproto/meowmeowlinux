kind: junction

sources:
  - kind: git_tag
    url: gitlab:freedesktop-sdk/freedesktop-sdk.git
    checkout-submodules: false
    track: release/25.08

config:
  options:
    target_arch: x86_64
