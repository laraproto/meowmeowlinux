kind: manual
description: Linux man pages

sources:
- kind: git_repo
  url: kernel:docs/man-pages/man-pages.git
  track: man-pages-6.18

build-depends:
- bootstrap/unadjusted.bst

config:
  build-commands:
  - rm -v man3/crypt*
  install-commands:
  - |
    make -R GIT=false prefix=%{install-root}/usr install
