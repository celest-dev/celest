#!/bin/sh

set -e

mkdir -p out/release
pushd out/release
trap "popd" EXIT

ARCH=arm64
ENGINE_ROOT=$HOME/dev/flutter/flutter/engine/src
FLUTTER_SDK=$ENGINE_ROOT/out/host_release_arm64
DART_SDK=$FLUTTER_SDK/dart-sdk

_dump_kernel() {
    $DART_SDK/bin/dart $ENGINE_ROOT/flutter/third_party/dart/pkg/vm/bin/dump_kernel.dart $1 "$1.txt"
}

cp $FLUTTER_SDK/icudtl.dat .

# fvm use master
# fvm flutter pub get

echo "Generating AOT kernel"
FRONTEND_SERVER=$DART_SDK/bin/snapshots/frontend_server_aot.dart.snapshot
SDK_ROOT=$FLUTTER_SDK/flutter_patched_sdk
$DART_SDK/bin/dartaotruntime $FRONTEND_SERVER \
    --aot \
    --tfa \
    --no-support-mirrors \
    --sdk-root=$SDK_ROOT \
    --link-platform \
    --target=flutter \
    -Ddart.vm.product=true \
    --output-dill=main.aot.dill \
    ../../main_no_deps.dart

$DART_SDK/bin/dart compile aot-snapshot --output=main.aot.test ../../main_no_deps.dart

echo "Dumping AOT kernel text"
_dump_kernel main.aot.dill

echo "Generating AOT snapshot ELF"
$FLUTTER_SDK/gen_snapshot \
    --snapshot_kind=app-aot-elf \
    --elf=main.aot \
    main.aot.dill

echo "Generating AOT snapshot library"
$FLUTTER_SDK/gen_snapshot \
    --snapshot_kind=app-aot-assembly \
    --assembly=main.S \
    main.aot.dill
xcrun clang -arch $ARCH -dynamiclib -o main.so main.S

echo "Running AOT snapshot"
$FLUTTER_SDK/flutter_tester \
    --non-interactive \
    --run-forever \
    --disable-vm-service \
    --verbose-logging \
    --icu-data-file-path=$FLUTTER_SDK/icudtl.dat \
    $PWD/main.so
