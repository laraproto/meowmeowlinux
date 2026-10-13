kind: autotools

sources:
  - kind: tar
    url: openbsd:OpenSSH/portable/openssh-10.6p1.tar.gz

build-depends:
  - groups/autotools.bst

depends:
  - pkgs/linux-pam.bst

variables:
  conf-local: >-
    --with-pid-dir=/run
    --with-privsep-path=/var/lib/sshd
    --with-pam
  sysconfdir: /etc/ssh

# TODO: SSHD needs sensible default configuration.
