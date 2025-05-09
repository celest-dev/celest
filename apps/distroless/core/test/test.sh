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

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DART_TEST_DIR=$(cd $SCRIPT_DIR/../../dart/test; pwd)

mkdir -p out
cd out
trap "cd $SCRIPT_DIR" EXIT

OUT_DIR=$SCRIPT_DIR/out

dart pub get -C $DART_TEST_DIR
dart compile exe --target-os=linux $DART_TEST_DIR/main.dart -o $OUT_DIR/main.exe

echo "Built $OUT_DIR/main.exe"

CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)
export PORT=9000

run_container() {
  docker run --rm -d \
    -v $OUT_DIR:/app \
    --user "$CURRENT_UID:$CURRENT_GID" \
    -p $PORT:$PORT \
    celestdev/runtime:latest
}
SERVER_PID=$(run_container)

trap "docker kill $SERVER_PID || true" EXIT

sleep 3 # wait for server to start
dart run $DART_TEST_DIR/client.dart
