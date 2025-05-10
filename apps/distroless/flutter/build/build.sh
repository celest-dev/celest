#!/bin/sh

set -eu

case `uname -m` in
    x86_64|amd64|AMD64)
        ADDITIONAL_ARGS=""
        ;;
    aarch64)
        ADDITIONAL_ARGS="--linux --linux-cpu=arm64"
        ;;
    *)
        >&2 echo "Unsupported architecture: $(uname -m)"
        exit 1
        ;;
esac

./flutter/tools/gn \
    --runtime-mode=release \
    --lto \
    --no-goma \
    --no-rbe \
    --no-stripped \
    --verbose \
    --no-prebuilt-dart-sdk \
    --no-enable-unittests \
    --enable-fontconfig \
    --target-dir=host_release \
    ${ADDITIONAL_ARGS}
ninja -C out/host_release -j$(nproc)
