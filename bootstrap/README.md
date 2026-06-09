# carbonOS Bootstrap

This is the bootstrap module used to build carbonOS. It starts itself off
with a few packages from freedesktop-sdk (mostly their autotools stack),
and then builds a usable system image in such a way that it won't conflict
with a "final" OS build

## Usage

To use the bootstrap, simply junction off of it. You can pull `unadjusted.bst`
through the junction to get a bootstrap toolchain that produces functional
executables that link against the bootstrap's libraries (this will be necessary
to build linux-headers and glibc). Once you build a functional glibc, however,
you can pull `adjusted.bst` through the junction. This will give you a bootstrap
toolchain that will link binaries against the final system's glibc & other libraries.

You'll also need to add `/tools/bin` to the end of `PATH` in your buildstream project

## Bootstrap Process

carbonOS ultimately bootstraps itself off of the
[Freedesktop SDK](https://gitlab.com/freedesktop-sdk/freedesktop-sdk). A cross-toolchain
is built to separate carbonOS's libraries from fd.o's, and then the cross-toolchain is
used to build caronOS's system-bootstrap toolchain. Once the system-bootstrap is built,
the fd.o SDK is discarded. The system-bootstrap module is then used to build carbonOS's
final toolchain, along with some other related packages, and is finally discarded.

This bootstrap was originally heavily inspired by the instructions in LinuxFromScratch
v9 Chapter 5, though keep in mind that it is not identical & no effort will be made to
keep up-to-date with the instructions in LFS.

Here's the toolchain build order:
1. binutils-cross
2. gcc-cross
3. linux-api-headers
4. glibc
5. libstdcxx, binutils
6. gcc
7. Everything else in `pkgs/`
8. (in final OS, using unadjusted bootstrap) linux-api-headers
9. (in final OS, using unadjusted bootstrap) glibc
10. (in final OS, using adjusted bootstrap) everything else

## Project structure

- `elements/`: [BuildStream](https://buildstream.build) elements that define the bootstrap's components
    - `pkgs/`: Individual packages that make up the bootstrap
    - `tools/`: Elements that are there to help the build in some way
    - `all.bst`: List of all the packages that make up the bootstrap toolchain
    - `freedesktop-sdk.bst`: Junction to fdo sdk
    - `bst-plugins.bst` and `bst-plugins-experimental.bst`: Buildstream plugin junctions
    - `unadjusted.bst`: API. Bootstrap toolchain that links against bootstrap libs
    - `adjusted.bst`: API. Bootstrap toolchain that links against final system libs
- `files/`: Various auxiliary files that are part of carbonOS's build (i.e. default config)
- `patches/`: Patches that get applied onto packages in `elements/`. Ideally kept to a minimum
- `plugins/`: Custom BuildStream plugins that are used in `elements/`
- `project.conf`: The BuildStream project configuration
- `*.refs`: Used by BuildStream to keep track of the versions of various components
- `result/`: Standard location that `just checkout` exports BuildStream artifacts to

## Build instructions

#### Auto-building

If you followed the usage instructions, the bootstrap should be built & rebuilt as appropriate
automatically by Buildstream. I'll leave figuring out artifact caching, CI/CD, etc as an exercise to
the reader. However, if you want to build the bootstrap manually for whatever reason, keep reading

#### Dependencies

First, you need to install build dependencies. If you are running carbonOS, this
is simple:
```bash
TODO
```

Your system should now be set up for carbonOS development. If you are not
running carbonOS, you'll need to install these packages to compile the bootstrap module:

- buildstream 2.0.1
- python3-dulwich
- [just](https://just.systems) (not needed to use via a junction!)

#### Building

To build the bootstrap, simply run `just build`. This will build the entire
bootstrap module. You can then use buildstream's built-in artifact caching & related
features to handle the output of this build efficiently
