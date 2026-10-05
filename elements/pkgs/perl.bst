kind: make

build-depends:
  - pkgs/gcc.bst
  - pkgs/bash.bst
  - pkgs/coreutils.bst
  - pkgs/sed.bst
  - pkgs/grep.bst
  - pkgs/gawk.bst
  - pkgs/make.bst

depends:
  - pkgs/glibc.bst

sources:
  - kind: tar
    url: cpan:src/5.0/perl-5.44.0.tar.xz

config:
  configure-commands:
    - sh Configure -des
             -D prefix=%{prefix}
             -D vendorprefix=%{prefix}
             -D useshrplib
             -D privlib=%{libdir}/perl5/core_perl
             -D archlib=%{libdir}/perl5/core_perl
             -D sitelib=%{libdir}/perl5/site_perl
             -D sitearch=%{libdir}/perl5/site_perl
             -D vendorlib=%{libdir}/perl5/vendor_perl
             -D vendorarch=%{libdir}/perl5/vendor_perl
             -D cc=gcc
