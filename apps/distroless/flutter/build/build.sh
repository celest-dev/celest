#!/bin/bash

set -e

#!/bin/bash
ENGINE_DIR="/engine/src"
if [ "${TARGETPLATFORM}" == "linux/arm64" ]; then
  PLATFORM="linux-arm64"
  CONFIG="linux_release_arm64"
else
  PLATFORM="linux-x64"
  CONFIG="host_release_desktop"
fi
DART_SDK_DIR="${ENGINE_DIR}/flutter/prebuilts/${PLATFORM}/dart-sdk"
DART="${DART_SDK_DIR}/bin/dart"
./flutter/tools/gn --no-goma --runtime-mode=release
mv "${ENGINE_DIR}/out/${CONFIG}" /engine/out
