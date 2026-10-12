kind: manual

build-depends:
  - groups/autotools.bst
  - pkgs/go.bst

config:
  build-commands:
    - |
      cd generator
      CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}" \
        go build -trimpath \
          -buildmode=pie \
          -mod=readonly \
          -modcacherw \
          -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""

      cd ../init
      CGO_ENABLED=1 go build -trimpath -mod=readonly -modcacherw

      cd fido2plugin
      CGO_ENABLED=1 CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}" \
        go build -trimpath -mod=readonly -modcacherw -buildmode=plugin -o ../fido2plugin.so .
  install-commands:
    - |
      mkdir -p "%{install-root}/etc"
      touch "%{install-root}/etc/booster.yaml"
      install -Dp -m755 generator/generator "%{install-root}/usr/bin/booster"
      install -Dp -m755 init/init "%{install-root}/usr/lib/booster/init"
      install -Dp -m755 init/fido2plugin.so "%{install-root}/usr/lib/booster/fido2plugin.so"
sources:
  - kind: git_repo
    url: github:anatol/booster.git
    track: "*.*"
  - kind: go_module
    url: github:anatol/clevis.go
    module: github.com/anatol/clevis.go
  - kind: go_module
    url: github:anatol/devmapper.go
    module: github.com/anatol/devmapper.go
  - kind: go_module
    url: github:anatol/go-udev
    module: github.com/anatol/go-udev
  - kind: go_module
    url: github:anatol/luks.go
    module: github.com/anatol/luks.go
  - kind: go_module
    url: github:anatol/smart.go
    module: github.com/anatol/smart.go
  - kind: go_module
    url: github:anatol/tang.go
    module: github.com/anatol/tang.go
  - kind: go_module
    url: github:anatol/vmtest
    module: github.com/anatol/vmtest
  - kind: go_module
    url: github:cavaliergopher/cpio.git
    module: github.com/cavaliergopher/cpio
  - kind: go_module
    url: github:google/go-tpm.git
    module: github.com/google/go-tpm
  - kind: go_module
    url: github:google/renameio.git
    module: github.com/google/renameio/v2
  - kind: go_module
    url: github:insomniacslk/dhcp.git
    module: github.com/insomniacslk/dhcp
  - kind: go_module
    url: github:jessevdk/go-flags.git
    module: github.com/jessevdk/go-flags
  - kind: go_module
    url: github:keys-pub/go-libfido2.git
    module: github.com/keys-pub/go-libfido2
  - kind: go_module
    url: github:klauspost/compress.git
    module: github.com/klauspost/compress
  - kind: go_module
    url: github:stretchr/testify.git
    module: github.com/stretchr/testify
  - kind: go_module
    url: github:ulikunitz/xz.git
    module: github.com/ulikunitz/xz
  - kind: go_module
    url: github:vishvananda/netlink.git
    module: github.com/vishvananda/netlink
  - kind: go_module
    url: github:xi2/xz.git
    module: github.com/xi2/xz
  - kind: go_module
    url: github:yookoala/realpath.git
    module: github.com/yookoala/realpath
  - kind: go_module
    url: github:golang/crypto
    module: golang.org/x/crypto
  - kind: go_module
    url: github:golang/sys
    module: golang.org/x/sys
  - kind: go_module
    url: github:go-yaml/yaml
    module: gopkg.in/yaml.v3
  - kind: go_module
    url: github:davecgh/go-spew.git
    module: github.com/davecgh/go-spew
  - kind: go_module
    url: github:decred/dcrd.git
    module: github.com/decred/dcrd/dcrec/secp256k1/v4
  - kind: go_module
    url: github:dgryski/go-camellia.git
    module: github.com/dgryski/go-camellia
  - kind: go_module
    url: github:goccy/go-json.git
    module: github.com/goccy/go-json
  - kind: go_module
    url: github:jzelinskie/whirlpool.git
    module: github.com/jzelinskie/whirlpool
  - kind: go_module
    url: github:lestrrat-go/blackmagic.git
    module: github.com/lestrrat-go/blackmagic
  - kind: go_module
    url: github:lestrrat-go/dsig.git
    module: github.com/lestrrat-go/dsig
  - kind: go_module
    url: github:lestrrat-go/dsig-secp256k1.git
    module: github.com/lestrrat-go/dsig-secp256k1
  - kind: go_module
    url: github:lestrrat-go/httpcc.git
    module: github.com/lestrrat-go/httpcc
  - kind: go_module
    url: github:lestrrat-go/httprc.git
    module: github.com/lestrrat-go/httprc/v3
  - kind: go_module
    url: github:lestrrat-go/jwx.git
    module: github.com/lestrrat-go/jwx/v3
  - kind: go_module
    url: github:lestrrat-go/option.git
    module: github.com/lestrrat-go/option/v2
  - kind: go_module
    url: github:pierrec/lz4.git
    module: github.com/pierrec/lz4/v4
  - kind: go_module
    url: github:pkg/errors.git
    module: github.com/pkg/errors
  - kind: go_module
    url: github:pmezard/go-difflib.git
    module: github.com/pmezard/go-difflib
  - kind: go_module
    url: github:segmentio/asm.git
    module: github.com/segmentio/asm
  - kind: go_module
    url: github:u-root/uio.git
    module: github.com/u-root/uio
  - kind: go_module
    url: github:valyala/fastjson.git
    module: github.com/valyala/fastjson
  - kind: go_module
    url: github:vishvananda/netns.git
    module: github.com/vishvananda/netns
  - kind: go_module
    url: github:golang/net
    module: golang.org/x/net
