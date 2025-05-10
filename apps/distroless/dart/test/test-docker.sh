#!/bin/sh

set -e

if [ -n "$FLUTTER_ROOT" ]; then
  DART_HOME="$FLUTTER_ROOT/bin/cache/dart-sdk"
fi
if [ -z "$DART_HOME" ]; then
  echo "DART_HOME is not set"
  exit 1
fi
if [ -z "$DART_VERSION" ]; then
  DART_VERSION=$(cat $DART_HOME/version)
fi

echo "DART_HOME: $DART_HOME"
echo "DART_VERSION: $DART_VERSION"

DART="$DART_HOME/bin/dartaotruntime"
FE_SNAPSHOT="$DART_HOME/bin/snapshots/frontend_server_aot.dart.snapshot"
VM_PLATFORM="$DART_HOME/lib/_internal/vm_platform_strong_product.dill"

SCRIPT_DIR=$(cd $(dirname $0); pwd)

mkdir -p out
cd out
trap "cd $SCRIPT_DIR" EXIT

OUT_DIR=$SCRIPT_DIR/out

$DART $FE_SNAPSHOT \
    --sdk-root $DART_HOME \
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
export PORT=9000

docker run --rm \
    -v $OUT_DIR:/app \
    --user "$CURRENT_UID:$CURRENT_GID" \
    celestdev/dart-builder:${DART_VERSION}

run_container() {
  docker run --rm -d \
    -v $OUT_DIR:/app \
    --user "$CURRENT_UID:$CURRENT_GID" \
    -p $PORT:$PORT \
    celestdev/dart-runtime:${DART_VERSION}
}
SERVER_PID=$(run_container)

trap "docker kill $SERVER_PID || true" EXIT

sleep 3 # wait for server to start
dart run $SCRIPT_DIR/client.dart
