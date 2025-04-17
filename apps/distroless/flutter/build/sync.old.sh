#!/bin/bash

set -e

cat <<EOF > .gclient
solutions = [
  {
    "managed": False,
    "name": "src/flutter",
    "url": "https://github.com/flutter/engine@${FLUTTER_VERSION}",
    "custom_deps": {},
    "deps_file": "DEPS",
    "safesync_url": "",
    "custom_vars": {
      "download_esbuild": False,
      "download_android_deps": False,
      "download_fuchsia_deps": False,
    }
  },
]
EOF

gclient sync \
    --no-history \
    --shallow \
    --verbose
