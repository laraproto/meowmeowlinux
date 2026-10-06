kind: manual

sources:
  - kind: git_repo
    url: sourceware:bzip2.git
    track: bzip2-*.*.*

build-depends:
  - groups/autotools.bst
  - pkgs/diffutils.bst
  
# Taken and modified from https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/blob/675305b60a976089d79d7e816161f8c7de51dd45/elements/bootstrap/bzip2.bst
config:
  build-commands:
  - |
    make -f Makefile-libbz2_so
  - |
    make bzip2recover

  install-commands:
  - |
    ln -s libbz2.so.1.0 libbz2.so.1
  - |
    full_name="$(readlink libbz2.so.1)"
    install -D -m 755 "${full_name}" --target-directory %{install-root}%{libdir}
    ln -s "${full_name}" %{install-root}%{libdir}/libbz2.so.1
    ln -s "${full_name}" %{install-root}%{libdir}/libbz2.so
    install -D -m 755 bzip2-shared %{install-root}%{bindir}/bzip2
    ln -s bzip2 %{install-root}%{bindir}/bzcat
    ln -s bzip2 %{install-root}%{bindir}/bunzip2
    install -D -m 755 bzip2recover --target-directory %{install-root}%{bindir}
    install -D -m 755 bzmore --target-directory %{install-root}%{bindir}
    ln -s bzmore %{install-root}%{bindir}/bzfless
    install -D -m 755 bzgrep --target-directory %{install-root}%{bindir}
    ln -s bzgrep %{install-root}%{bindir}/bzegrep
    ln -s bzgrep %{install-root}%{bindir}/bzfgrep
    install -D -m 755 bzdiff --target-directory %{install-root}%{bindir}
    ln -s bzdiff %{install-root}%{bindir}/bzcmp
    install -D -m 755 bzlib.h --target-directory %{install-root}%{includedir}
    install -D -m 755 bzgrep.1 bzmore.1 bzdiff.1 --target-directory %{install-root}%{mandir}/man1
