kind: autotools

(@):
  - elements/bootstrap/stage1/common.yml

sources:
  - kind: gnu
    name: coreutils

build-depends:
  - bootstrap/stage1/base.bst
  - bootstrap/stage1/help2man.bst

depends:
  - bootstrap/stage1/attr.bst

variables:
  conf-local: --without-selinux --enable-no-install-program=cksum,md5sum,sha1sum,sha224sum,sha256sum,sha384sum,sha512sum

environment:
  FORCE_UNSAFE_CONFIGURE: 1
