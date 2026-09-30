kind: autotools

sources:
  - kind: git
    url: github:PCRE2Project/pcre2
    track: pcre2-10.49
    submodules:
      deps/sljit:
        url: github:zherczeg/sljit

build-depends:
  - bootstrap/stage1/base.bst

variables:
  conf-local: >-
    --enable-unicode
    --enable-jit
    --enable-pcre2-16
    --enable-pcre2-32
    --enable-pcre2grep-libz
    --enable-pcre2grep-libbz2
    --enable-pcre2test-libreadline
    --disable-static
