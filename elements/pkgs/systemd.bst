kind: meson

sources:
  - kind: git_repo
    url: github:systemd/systemd.git
    track: v*
    exclude:
      - "*rc*"

#build-depends:
# meson compiler

