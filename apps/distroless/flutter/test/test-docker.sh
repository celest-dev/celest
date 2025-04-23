#!/bin/sh

set -e

if [ -n "$FLUTTER_ROOT" ]; then
  FLUTTER_SDK="$FLUTTER_ROOT"
fi
if [ -z "$FLUTTER_VERSION" ]; then
  FLUTTER_VERSION=$(cat $FLUTTER_SDK/version)
fi

echo "FLUTTER_SDK: $FLUTTER_SDK"
echo "FLUTTER_VERSION: $FLUTTER_VERSION"

SCRIPT_DIR=$(cd $(dirname $0); pwd)

rm -rf out/release
mkdir -p out/release
cd out/release
trap "cd $SCRIPT_DIR" EXIT

DART_SDK=$FLUTTER_SDK/bin/cache/dart-sdk

echo "Generating AOT kernel"
FRONTEND_SERVER=$DART_SDK/bin/snapshots/frontend_server_aot.dart.snapshot
SDK_ROOT=$FLUTTER_SDK/bin/cache/artifacts/engine/common/flutter_patched_sdk
$DART_SDK/bin/dartaotruntime $FRONTEND_SERVER \
    --aot \
    --tfa \
    --no-support-mirrors \
    --sdk-root=$SDK_ROOT \
    --link-platform \
    --target=flutter \
    -Ddart.vm.product=true \
    --output-dill=main.aot.dill \
    ../../main.dart
echo "Built $PWD/main.aot.dill"

CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)

docker run --rm \
    --platform=linux/amd64 \
    -v $PWD:/app \
    --user "$CURRENT_UID:$CURRENT_GID" \
    celestdev/flutter-builder:${FLUTTER_VERSION}
echo "Built $PWD/main.aot"

run_container() {
    docker run --rm -d \
        --platform=linux/amd64 \
        -v $PWD:/app \
        --user "$CURRENT_UID:$CURRENT_GID" \
        -p 9000:9000 \
        celestdev/flutter-runtime:${FLUTTER_VERSION}
}
SERVER_PID=$(run_container)

trap "docker kill -sSIGKILL $SERVER_PID" EXIT

sleep 3 # wait for server to start
dart run $SCRIPT_DIR/client.dart
