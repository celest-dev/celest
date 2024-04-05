import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/isolated/isolated_storage_platform.unsupported.dart'
    if (dart.library.js_interop) 'package:native_storage/src/isolated/isolated_storage_platform.web.dart'
    if (dart.library.isolate) 'package:native_storage/src/isolated/isolated_storage_platform.vm.dart';

/// A [NativeStorage] constructor.
typedef NativeStorageFactory = NativeStorage Function({
  String? namespace,
  String? scope,
});

/// {@template native_storage.isolated_native_storage}
/// A [NativeStorage] that performs storage operations asynchronously on a
/// separate isolate.
///
/// On Web platforms, this simply returns an asynchronous wrapper over the same
/// non-isolated storage.
/// {@endtemplate}
abstract interface class IsolatedNativeStorage {
  /// {@macro native_storage.isolated_native_storage}
  factory IsolatedNativeStorage({
    required NativeStorageFactory factory,
    String? namespace,
    String? scope,
  }) = IsolatedNativeStoragePlatform;

  /// Reads a value asynchronously from storage on a background thread.
  Future<String?> read(String key);

  /// Writes a value asynchronously to storage on a background thread.
  Future<String> write(String key, String value);

  /// Deletes a value asynchronously from storage on a background thread.
  Future<String?> delete(String key);

  /// Clears all values asynchronously for the configured `namespace` and
  /// `scope` from storage.
  Future<void> clear();

  /// {@macro native_storage.native_storage.close}
  ///
  /// If [force] is `true`, any pending requests will be cancelled and complete
  /// with an error. Defaults to `false`.
  Future<void> close({bool force = false});
}
