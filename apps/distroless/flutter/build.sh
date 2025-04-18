#!/usr/bin/env bash
set -eux

FLUTTER_VERSION=${1:-3.29.3}
# TODO: Newer flutter versions don't support linux/arm64
# They're missing this dependency: https://github.com/flutter/flutter/blob/9d3d0dc0ed7bad45bb15e529f994a06760ca86e0/docs/platforms/android/Uploading-New-Java-Version-to-CIPD.md?plain=1#L21
# PLATFORMS=linux/amd64,linux/arm64
PLATFORMS=linux/amd64
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BUILD_SRC="${SCRIPT_DIR}/build"

pushd ${BUILD_SRC}

# Build the builder image
docker build --platform=${PLATFORMS} \
    --build-arg FLUTTER_VERSION=${FLUTTER_VERSION} \
    --target=builder \
    -t celestdev/flutter-builder:${FLUTTER_VERSION} .

# Build and push the runtime image
docker build --platform=${PLATFORMS} \
    --build-arg FLUTTER_VERSION=${FLUTTER_VERSION} \
    --target=runtime \
    -t celestdev/flutter-runtime:${FLUTTER_VERSION} .
