# meowmeowlinux (very yes placeholder name)

Dumb immutable linux distro stuff in here, beware, for you may find stupid.

## Can this be used yet

No.

## Deps and other stuff

Freedesktop SDK gets really unhappy if you don't have `lzip` installed on your host system, so be sure to get that

Buildstream and mkosi are required here, in addition buildstream has to have requests and dulwich installed in it's environment, install them with the following commands:
```sh
pipx install git+https://github.com/systemd/mkosi.git
pipx install buildstream
pipx inject buildstream requests dulwich
```
