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
  }) {
    final isValidNamespace =
        namespace == null || _validNamespace.hasMatch(namespace);
    if (!isValidNamespace) {
      throw ArgumentError.value(
        namespace,
        'namespace',
        'Invalid namespace. Must match $_validNamespace',
      );
    }
    return NativeLocalStorage(namespace: namespace, scope: scope);
  }

  static final _validNamespace = RegExp(
    r'^[a-z0-9]+(\.[a-z0-9]+)+$',
    caseSensitive: false,
  );

  /// {@template native_storage.native_storage.namespace}
  /// The main identifier all values are stored under.
  ///
  /// To avoid conflicts with other storage instances, this value should be
  /// unique to the app or package. It is recommended to always use your
  /// application or bundle identifier, which is the default if not passed.
  ///
  /// If provided, it must match the regular expression
  /// `^[a-z0-9]+(\.[a-z0-9]+)+$`, which is that of an bundle identifier.
  /// {@endtemplate}
  String get namespace;

  /// {@template native_storage.native_storage.scope}
  /// An optional tag for separating values for different parts of your app.
  ///
  /// This can be passed to [NativeStorage.new] or dynamically created via
  /// [scoped] which will create a subscope if this is not `null`.
  ///
  /// Scopes are separated by a `/` character and, unlike [namespace], are used
  /// to create a logical, but not physical, separation of values. For example,
  /// if [scope] is `settings`, calling `storage.write('theme', 'dark')` will
  /// store the value under the storage key `settings/theme`.
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

  /// Creates a new [NativeStorage] instance with the same configuration as
  /// this instance, but with the provided [scope].
  ///
  /// If the current instance already has a [scope], the new instance will have
  /// a combined scope of both the current and provided scopes.
  NativeStorage scoped(String scope);
}
