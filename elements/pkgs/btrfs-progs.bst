kind: make

sources:
  - kind: git_repo
    url: kernel:linux/kernel/git/kdave/btrfs-progs.git
    track: v*

build-depends:
  - pkgs/autoconf.bst
  - pkgs/automake.bst
  - pkgs/m4.bst
  - pkgs/pkgconf.bst
  - groups/autotools.bst
  - pkgs/python/sphinx.bst

depends:
  - pkgs/openssl3.bst
  - pkgs/zstd.bst
  - pkgs/zlib.bst
  - pkgs/lzo.bst
  - pkgs/util-linux.bst
  - pkgs/e2fsprogs.bst
  - pkgs/systemd.bst
  - pkgs/python.bst
  - pkgs/python/docutils.bst
  - pkgs/python/babel.bst
  - pkgs/python/jinja2.bst
  - pkgs/python/pygments.bst
  - pkgs/python/packaging.bst
  - pkgs/python/imagesize.bst
  - pkgs/python/roman-numerals.bst
  - pkgs/python/requests.bst
  - pkgs/python/urllib3.bst
  - pkgs/python/idna.bst
  - pkgs/python/certifi.bst
  - pkgs/python/alabaster.bst
  - pkgs/python/sphinxcontrib-applehelp.bst
  - pkgs/python/sphinxcontrib-devhelp.bst
  - pkgs/python/sphinxcontrib-htmlhelp.bst
  - pkgs/python/sphinxcontrib-serializinghtml.bst
  - pkgs/python/sphinxcontrib-qthelp.bst
  - pkgs/python/sphinx-rtd-theme.bst
  - pkgs/python/sphinxcontrib-jquery.bst
  - pkgs/python/setuptools.bst

config:
  configure-commands:
    - |
      ./autogen.sh
      ./configure
