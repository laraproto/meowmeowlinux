kind: cmake

sources:
  - kind: git_repo
    url: github:llvm/llvm-project
    track: llvmorg-*.*.*
    exclude:
      - llvmorg-*-*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst
  - pkgs/python.bst

depends:
  - pkgs/libffi.bst

variables:
  cmake-local: >-
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D LLVM_ENABLE_FFI=ON
    -D LLVM_ENABLE_RTTI=ON
    -D LLVM_TARGETS_TO_BUILD="host;AMDGPU"
    -D LLVM_ENABLE_PROJECTS=clang,lld,lldb
    -D LLVM_ENABLE_RUNTIMES=compiler-rt
    -D LLVM_BUILD_LLVM_DYLIB=ON
    -D LLVM_LINK_LLVM_DYLIB=ON
    -D BUILD_SHARED_LIBS=ON
    -D LLVM_BINUTILS_INCDIR=/usr/include
    -D CLANG_DEFAULT_PIE_ON_LINUX=ON
