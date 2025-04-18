#!/bin/bash

set -e

# For older flutter versions, pull the engine from the old engine repo.
if [[ $FLUTTER_VERSION < "3.28.0" ]]; then
  URL="https://github.com/flutter/engine"
  NAME="src/flutter"
else
  URL="https://github.com/flutter/flutter"
  NAME="."
fi

cat <<EOF > .gclient
solutions = [
  {
    "managed": False,
    "name": "${NAME}",
    "url": "${URL}@${FLUTTER_VERSION}",
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
