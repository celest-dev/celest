#!/bin/sh

set -e

mkdir -p out/debug
pushd out/debug
trap "popd" EXIT

ENGINE_ROOT=$HOME/dev/flutter/engine/src
FLUTTER_SDK=$ENGINE_ROOT/out/host_debug_unopt_arm64
DART_SDK=$ENGINE_ROOT/flutter/prebuilts/macos-arm64/dart-sdk

_dump_kernel() {
    $DART_SDK/bin/dart $ENGINE_ROOT/flutter/third_party/dart/pkg/vm/bin/dump_kernel.dart $1 "$1.txt"
}

cp $FLUTTER_SDK/icudtl.dat .
cp $FLUTTER_SDK/gen/flutter/lib/snapshot/vm_isolate_snapshot.bin vm_snapshot_data
cp $FLUTTER_SDK/gen/flutter/lib/snapshot/isolate_snapshot.bin isolate_snapshot_data

# fvm use master
# fvm flutter pub get

echo "Generating kernel"
FRONTEND_SERVER=$DART_SDK/bin/snapshots/frontend_server_aot.dart.snapshot
$DART_SDK/bin/dartaotruntime --disable-dart-dev $FRONTEND_SERVER \
    --sdk-root $FLUTTER_SDK/flutter_patched_sdk \
    --target=flutter \
    --link-platform \
    --output-dill=kernel_blob.bin \
    ../..//main_no_deps.dart

echo "Dumping kernel text"
_dump_kernel kernel_blob.bin

echo "Running kernel"
$FLUTTER_SDK/flutter_tester \
    --non-interactive \
    --run-forever \
    --disable-vm-service \
    --icu-data-file-path=$FLUTTER_SDK/icudtl.dat \
    $PWD/kernel_blob.bin
