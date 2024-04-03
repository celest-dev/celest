import 'package:native_storage/src/isolated/isolated_storage.dart';
import 'package:native_storage/src/local/local_storage.dart';
import 'package:native_storage/src/secure/secure_storage.dart';

/// An interface for native storage implementations.
///
/// - Use [NativeStorage.new] for app-local, persistent storage.
/// - Use [NativeStorage.secure] for platform-native secure storage.
abstract interface class NativeStorage {
  /// {@macro native_storage.native_local_storage}
  ///
  /// **NOTE**: Neither [namespace] nor [scope] may contain a path separator
  /// character (`/`).
  ///
  /// ## Namespace
  ///
  /// {@macro native_storage.native_storage.namespace}
  ///
  /// ## Scope
  ///
  /// {@macro native_storage.native_storage.scope}
  factory NativeStorage({
    String? namespace,
    String? scope,
  }) = NativeLocalStorage;

  /// {@template native_storage.native_storage.namespace}
  /// The main identifier all values are stored under.
  ///
  /// To avoid conflicts with other storage instances, this value should be
  /// unique to the app or package. It is recommended to always use your
  /// application or bundle identifier.
  /// {@endtemplate}
  String get namespace;

  /// {@template native_storage.native_storage.scope}
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

  /// {@template native_storage.native_storage.close}
  /// Frees up any resources associated with this storage instance.
  ///
  /// After calling this method, the storage instance must no longer be used.
  /// {@endtemplate}
  void close();

  /// {@macro native_storage.native_secure_storage}
  NativeSecureStorage get secure;

  /// {@macro native_storage.isolated_native_storage}
  IsolatedNativeStorage get isolated;

  /// Creates a new [PlatformStorage] instance with the same configuration as
  /// this instance, but with the provided [scope].
  ///
  /// If the current instance already has a [scope], the new instance will have
  /// a combined scope of both the current and provided scopes.
  NativeStorage scoped(String scope);
}
