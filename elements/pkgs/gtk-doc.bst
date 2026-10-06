kind: meson

sources:
  - kind: git_repo
    url: gnome-git:GNOME/gtk-doc
    track: 1.*.*

depends:
  - groups/autotools.bst
  - pkgs/meson.bst
  - pkgs/python-parameterized.bst
  - pkgs/python-pygments.bst
