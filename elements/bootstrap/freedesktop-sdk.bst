kind: junction
description: Imports the latest freedesktop-sdk to bootstrap off of
sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  checkout-submodules: false
  track: release/25.08

config:
  options:
    target_arch: x86_64
