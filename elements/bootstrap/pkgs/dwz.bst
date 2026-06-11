kind: make

sources:
- kind: git_tag
  url: sourceware:dwz.git
  track: dwz-0.14-branch
# Track here: https://sourceware.org/git/?p=dwz.git;a=tags

depends:
- bootstrap/pkgs/stage1/glibc.bst
- bootstrap/pkgs/elfutils.bst

build-depends:
- bootstrap/tools/toolchain.bst

(@):
  - elements/bootstrap/include/common.yml

variables:
  make-args: prefix=%{bootstrap-prefix}
