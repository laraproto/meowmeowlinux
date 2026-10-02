kind: stack

depends:
  - bootstrap/stage1/fdo.bst:public-stacks/buildsystem-autotools.bst
  - bootstrap/stage1/fdo.bst:components/bison.bst
  - bootstrap/stage1/fdo.bst:components/python3.bst
  - bootstrap/stage1/glibc.bst
  - bootstrap/stage1/linux-headers.bst
