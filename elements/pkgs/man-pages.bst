kind: make

sources:
  - kind: git_repo
    url: kernel:docs/man-pages/man-pages.git
    track: man-pages-6.19

build-depends:
  - groups/autotools.bst
  - pkgs/git.bst
  - pkgs/findutils.bst

variables:
  make-args: >-
    -R
    prefix="%{prefix}"

config:
  install-commands:
    (>):
      - |
        # The following is provided by components/shadow.bst
        rm "%{install-root}%{mandir}/man3/getspnam.3"
        rm "%{install-root}%{mandir}/man5/passwd.5"
        # The following is provided by bootstrap/libxcrypt.bst
        rm "%{install-root}%{mandir}/man3/crypt.3"
        rm "%{install-root}%{mandir}/man3/crypt_r.3"
