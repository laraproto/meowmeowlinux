kind: script
description: This does a basic test to make sure the toolchain is functional

# We can only test unadjusted, since adjusted can only produce functional
# binaries after the real glibc has been built...
build-depends:
- unadjusted.bst

variables:
  cwd: /build
  hello-src: |
    #include <stdio.h>
    int main(int argc, char *argv[]) {
      printf("Hello world!\n");
      return 0;
    }

config:
  layout:
  - element: unadjusted.bst
    destination: /
  - element: ''
    destination: /build
  commands:
  # Test toolchain
  - |
    cat <<- EOF > hello.c
    %{hello-src}
    EOF
  - gcc -g hello.c -o hello
  - ./hello > outfile
  - cmp outfile <(echo "Hello world!")

  # Test find-debuginfo
  - install -Dm755 hello %{install-root}/usr/bin/hello
  - sh -e find-debuginfo -i -m /build %{install-root} test-hello
  - test -f %{install-root}/usr/lib/debug/usr/bin/hello.debug
  - test -f %{install-root}/usr/src/debug/test-hello/hello.c
  - cmp -s %{install-root}/usr/src/debug/test-hello/hello.c hello.c
