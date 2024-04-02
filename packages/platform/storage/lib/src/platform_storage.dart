import 'package:platform_storage/src/isolated/isolated_storage.dart';
import 'package:platform_storage/src/local/local_storage.dart';
import 'package:platform_storage/src/secure/secure_storage.dart';

/// An interface for platform-specific storage implementations.
///
/// - Use [PlatformStorage.new] for app-local, persistent storage.
/// - Use [PlatformStorage.secure] for platform-native secure storage.
abstract interface class PlatformStorage {
  /// {@macro platform_storage.platform_local_storage}
  ///
  /// **NOTE**: Neither [namespace] nor [scope] may contain a path separator
  /// character (`/`).
  ///
  /// ## Namespace
  ///
  /// {@macro platform_storage.platform_storage.namespace}
  ///
  /// ## Scope
  ///
  /// {@macro platform_storage.platform_storage.scope}
  factory PlatformStorage({
    String? namespace,
    String? scope,
  }) = PlatformLocalStorage;

  /// {@template platform_storage.platform_storage.namespace}
  /// The main identifier all values are stored under.
  ///
  /// To avoid conflicts with other storage instances, this value should be
  /// unique to the app or package. It is recommended to always use your
  /// application or bundle identifier.
  /// {@endtemplate}
  String get namespace;

  /// {@template platform_storage.platform_storage.scope}
  /// An optional identifier to further scope values under.
  ///
  /// This can be used to separate values for different parts of your app.
  /// {@endtemplate}
  String? get scope;

  /// Reads a value synchronously from storage.
  String? read(String key);

  /// Writes a value synchronously to storage.
  String write(String key, String value);

  /// Deletes a value synchronously from storage.
  String? delete(String key);

  /// Clears all values synchronously for the configured `namespace` and `scope`
  /// from storage.
  void clear();

  /// {@template platform_storage.platform_storage.close}
  /// Frees up any resources associated with this storage instance.
  ///
  /// After calling this method, the storage instance must no longer be used.
  /// {@endtemplate}
  void close();

  /// {@macro platform_storage.platform_secure_storage}
  PlatformSecureStorage get secure;

  /// {@macro platform_storage.isolated_platform_storage}
  IsolatedPlatformStorage get isolated;

  /// Creates a new [PlatformStorage] instance with the same configuration as
  /// this instance, but with the provided [scope].
  ///
  /// If the current instance already has a [scope], the new instance will have
  /// a combined scope of both the current and provided scopes.
  PlatformStorage scoped(String scope);
}
