#!/bin/sh

set -e

if [ -n "$FLUTTER_ROOT" ]; then
  DART_SDK="$FLUTTER_ROOT/bin/cache/dart-sdk"
fi
if [ -z "$DART_SDK" ]; then
  echo "DART_SDK is not set"
  exit 1
fi
if [ -z "$DART_VERSION" ]; then
  DART_VERSION=$(cat $DART_SDK/version)
fi

DART="$DART_SDK/bin/dartaotruntime"
FE_SNAPSHOT="$DART_SDK/bin/snapshots/frontend_server_aot.dart.snapshot"
VM_PLATFORM="$DART_SDK/lib/_internal/vm_platform_strong_product.dill"

SCRIPT_DIR=$(cd $(dirname $0); pwd)

mkdir -p out
cd out
trap "cd $SCRIPT_DIR" EXIT

OUT_DIR=$SCRIPT_DIR/out

$DART $FE_SNAPSHOT \
    --sdk-root $DART_SDK \
    --platform $VM_PLATFORM \
    --aot \
    --tfa \
    --no-support-mirrors \
    --link-platform \
    --target=vm \
    -Ddart.vm.product=true \
    --output-dill=$OUT_DIR/main.aot.dill \
    $SCRIPT_DIR/main.dart

echo "Built $OUT_DIR/main.aot.dill"

CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)

docker run --rm \
    -v $OUT_DIR:/app \
    --user "$CURRENT_UID:$CURRENT_GID" \
    celestdev/dart-builder:${DART_VERSION}

run_container() {
  docker run --rm -d \
    -v $OUT_DIR:/app \
    --user "$CURRENT_UID:$CURRENT_GID" \
    -p 9000:9000 \
    celestdev/dart-runtime:${DART_VERSION}
}
SERVER_PID=$(run_container)

trap "docker kill $SERVER_PID || true" EXIT

sleep 3 # wait for server to start
dart run $SCRIPT_DIR/client.dart
