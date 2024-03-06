#!/bin/bash

set -euo pipefail

echo "Building example app..."
pushd example
flutter pub get
flutter build apk
popd

echo "Generating FFI bindings..."
dart run ffigen --config=ffigen.core_foundation.yaml
dart run ffigen --config=ffigen.security.yaml

echo "Generating JNI bindings..."
dart run jnigen --config=jnigen.yaml
