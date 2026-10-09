kind: cmake

sources:
  - kind: git_repo
    url: kde:frameworks/extra-cmake-modules
    track: v*.*.*
    exclude:
    - v*-*

depends:
  - groups/autotools.bst
  - pkgs/cmake.bst

config:
  configure-commands:
    (<):
      - |
        sed -i '/"lib64"/s/64//' kde-modules/KDEInstallDirsCommon.cmake

        sed -e '/PACKAGE_INIT/i set(SAVE_PACKAGE_PREFIX_DIR "${PACKAGE_PREFIX_DIR}")' -e '/^include/a set(PACKAGE_PREFIX_DIR "${SAVE_PACKAGE_PREFIX_DIR}")' -i ECMConfig.cmake.in

