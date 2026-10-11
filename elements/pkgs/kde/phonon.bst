kind: cmake

sources:
  - kind: git_repo
    url: kde:libraries/phonon
    track: v*.*.*

build-depends:
  - pkgs/cmake.bst
  - groups/autotools.bst
  - pkgs/kde/extra-cmake-modules.bst
  - pkgs/glib.bst
  - pkgs/qt.bst
