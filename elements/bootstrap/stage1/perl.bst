kind: make

(@): 
  - elements/bootstrap/stage1/common.yml

build-depends:
  - bootstrap/stage1/independent.bst

depends:
  - bootstrap/linker.bst # Perl seems to reset LDFLAGS.

sources:
  - kind: tar
    url: cpan:src/5.0/perl-5.44.0.tar.xz

config:
  configure-commands:
    - sh Configure -des
             -D prefix=/tools
             -D vendorprefix=/tools
             -D useshrplib
             -D privlib=/tools/lib/perl5/core_perl
             -D archlib=/tools/lib/perl5/core_perl
             -D sitelib=/tools/lib/perl5/site_perl
             -D sitearch=/tools/lib/perl5/site_perl
             -D vendorlib=/tools/lib/perl5/vendor_perl
             -D vendorarch=/tools/lib/perl5/vendor_perl
             -D cc=gcc
