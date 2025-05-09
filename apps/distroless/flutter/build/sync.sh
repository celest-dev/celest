#!/bin/sh

set -eu

case `uname -m` in
    x86_64|amd64|AMD64)
        ARCH="x64"
        ;;
    aarch64)
        ARCH="arm64"
        ;;
    *)
        >&2 echo "Unsupported architecture: $(uname -m)"
        exit 1
        ;;
esac

cat <<EOF > .gclient
solutions = [
  {
    "managed": False,
    "name": ".",
    "url": "https://github.com/flutter/flutter@${FLUTTER_VERSION}",
    "custom_deps": {},
    "deps_file": "DEPS",
    "safesync_url": "",
    "custom_vars": {
      "download_esbuild": False,
      "download_android_deps": False,
      "download_fuchsia_deps": False,
      "host_os": "linux",
      "host_cpu": "${ARCH}",
    }
  },
]

target_os_only = True
target_os = ["linux"]

target_cpu_only = True
target_cpu = ["${ARCH}"]
EOF

gclient sync \
    --no-history \
    --shallow \
    -j$(nproc) \
    --verbose
