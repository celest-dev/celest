import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/isolated/isolated_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:platform_storage/src/isolated/isolated_storage_platform.web.dart';

/// A [PlatformStorage] constructor.
typedef PlatformStorageFactory = PlatformStorage Function({
  String? namespace,
  String? scope,
});

/// {@template platform_storage.isolated_platform_storage}
/// A [PlatformStorage] that performs storage operations asynchronously on a
/// separate isolate.
///
/// On Web platforms, this simply returns an asynchronous wrapper over the same
/// non-isolated storage.
/// {@endtemplate}
abstract interface class IsolatedPlatformStorage {
  /// {@macro platform_storage.isolated_platform_storage}
  factory IsolatedPlatformStorage({
    required PlatformStorageFactory factory,
    String? namespace,
    String? scope,
  }) = IsolatedStoragePlatform;

  /// Reads a value asynchronously from storage on a background thread.
  Future<String?> read(String key);

  /// Writes a value asynchronously to storage on a background thread.
  Future<String> write(String key, String value);

  /// Deletes a value asynchronously from storage on a background thread.
  Future<String?> delete(String key);

  /// Clears all values asynchronously for the configured `namespace` and
  /// `scope` from storage.
  Future<void> clear();

  /// {@macro platform_storage.platform_storage.close}
  ///
  /// If [force] is `true`, any pending requests will be cancelled and complete
  /// with an error. Defaults to `false`.
  Future<void> close({bool force = false});
}
