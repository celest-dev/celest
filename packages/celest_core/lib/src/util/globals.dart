/// Whether running in debug mode.
const bool kDebugMode = !kReleaseMode && !kProfileMode;

/// Whether running in release mode.
const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');

/// Whether running in profile mode.
const bool kProfileMode = bool.fromEnvironment('dart.vm.profile');

/// Whether running on the Web (JavaScript or WASM).
const bool kIsWeb = bool.fromEnvironment('dart.library.js_interop');

/// Whether running in a Dart native environment (i.e. the VM).
const bool kIsDartNative = !kIsWeb && !kIsFlutter;

/// Whether running in Flutter (as opposed to Dart-only).
const bool kIsFlutter = bool.fromEnvironment('dart.library.ui');
