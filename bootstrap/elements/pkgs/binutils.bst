kind: autotools

sources:
- kind: gnu
  name: binutils

build-depends:
- freedesktop-sdk.bst:components/texinfo.bst
- tools/import-fdo.bst
- pkgs/gcc-cross.bst
- pkgs/binutils-cross.bst
- pkgs/glibc.bst
- pkgs/linux-api-headers.bst
- tools/sysroot-setup.bst

environment:
  CC: "%{bootstrap-triplet}-gcc"
  AR: "%{bootstrap-triplet}-ar"
  RANLIB: "%{bootstrap-triplet}-ranlib"

variables:
  build-dir: build
  conf-local: >-
    --with-lib-path=%{libdir}
    --disable-nls --disable-werror
    --with-sysroot
    --disable-gprofng

# TODO: Comment style
# buildstream doesn't like the way we put comments when using ref-storage:inline.
# So, once we switch back to ref-storage:project.refs, put the comments back where
# they belong
config:
  install-commands:
    (>):
    # Adjusted linker for post-bootstrap. Will be used between final glibc & final binutils
    - |
      make -C %{build-dir}/ld clean
      make -C %{build-dir}/ld LIB_PATH=/usr/lib
      cp -v %{build-dir}/ld/ld-new %{install-root}%{bindir}

    # Delete .info files because they overlap binutils-cross and for whatever reason overlap-whitelist doesn't work
    - |
      rm -v %{install-root}%{datadir}/info/{dir,*.info}
