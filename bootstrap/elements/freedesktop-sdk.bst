kind: junction
description: Imports the latest freedesktop-sdk to bootstrap off of
sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  checkout-submodules: false
#  track: release/22.08
# TODO: Switch back to a stable release stream once 23.08 is out for good

#config:
#  options:
#    target_arch: x86_64 # TODO
