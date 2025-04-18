#!/bin/sh

set -e

PACKAGE_ROOT=$PWD

rm -r out/debug-vanilla
mkdir -p out/debug-vanilla
pushd out/debug-vanilla
trap "popd" EXIT

ENGINE_ROOT=/Users/dillonnys/flutter
CACHE=$ENGINE_ROOT/bin/cache
ARTIFACTS=$CACHE/artifacts
FLUTTER_SDK=$ARTIFACTS/engine/darwin-x64
DART_SDK=$CACHE/dart-sdk

cp $FLUTTER_SDK/vm_isolate_snapshot.bin vm_snapshot_data
cp $FLUTTER_SDK/isolate_snapshot.bin isolate_snapshot_data

$ENGINE_ROOT/bin/flutter pub get

echo "Generating kernel"
SDK_ROOT=$ARTIFACTS/engine/common/flutter_patched_sdk
FRONTEND_SERVER=$DART_SDK/bin/snapshots/frontend_server_aot.dart.snapshot
$DART_SDK/bin/dartaotruntime --disable-dart-dev $FRONTEND_SERVER \
    --sdk-root=$SDK_ROOT \
    --target=flutter \
    --link-platform \
    --output-dill=kernel_blob.bin \
    $PACKAGE_ROOT/main.dart

echo "Running kernel"
$FLUTTER_SDK/flutter_tester \
    --non-interactive \
    --run-forever \
    --icu-data-file-path=$FLUTTER_SDK/icudtl.dat \
    --packages=$PACKAGE_ROOT/.dart_tool/package_config.json \
    --log-tag=_CELEST \
    --verbose-logging \
    $PWD/kernel_blob.bin
