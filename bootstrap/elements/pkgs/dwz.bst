kind: make

sources:
- kind: git_tag
  url: sourceware:dwz.git
  track: dwz-0.14-branch
# Track here: https://sourceware.org/git/?p=dwz.git;a=tags

depends:
- pkgs/glibc.bst
- pkgs/elfutils.bst

build-depends:
- tools/toolchain.bst

variables:
  make-args: prefix=%{prefix}
