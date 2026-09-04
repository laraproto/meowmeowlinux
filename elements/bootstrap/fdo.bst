kind: junction

sources:
  - kind: git_tag
    url: gitlab:freedesktop-sdk/freedesktop-sdk.git
    checkout-submodules: false
    track: freedesktop-sdk-26.08.0

config:
  options:
    target_arch: x86_64
