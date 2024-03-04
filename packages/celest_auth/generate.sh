#!/bin/bash

set -euo pipefail

FOUNDATION_SYMBOLS=lib/src/native/darwin/foundation.yaml
FOUNDATION_URI=package:celest_auth/src/native/darwin/foundation.ffi.dart

echo "Building example app..."
# pushd example
# flutter pub get
# flutter build apk
# flutter build macos
# popd

echo "Generating FFI bindings..."
dart run ffigen --config=ffigen.core_foundation.yaml
dart run ffigen --config=ffigen.foundation.yaml
echo "Removing 'instancetype' from FFI bindings..."
yq -i "del(.files.\"${FOUNDATION_URI}\".symbols.\"c:@T@instancetype\")" ${FOUNDATION_SYMBOLS}
dart run ffigen --config=ffigen.security.yaml
dart run ffigen --config=ffigen.darwin.yaml

echo "Generating JNI bindings..."
# dart run jnigen --config=jnigen.yaml
