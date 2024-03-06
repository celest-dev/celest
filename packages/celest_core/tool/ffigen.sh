#!/bin/bash

set -euo pipefail

echo "Building example app..."
pushd example
flutter pub get
flutter build apk
popd

echo "Checking out submodules..."
git submodule update --init

echo "Generating FFI bindings..."
dart run ffigen --config=ffigen.core_foundation.yaml
dart run ffigen --config=ffigen.security.yaml
if "$(uname)" == "Darwin"; then 
    echo "Skipping Linux bindings." >&2
else 
    dart run ffigen --config=ffigen.glib.yaml
    dart run ffigen --config=ffigen.libsecret.yaml
fi

echo "Generating JNI bindings..."
dart run jnigen --config=jnigen.yaml
