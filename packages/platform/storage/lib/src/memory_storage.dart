import 'package:native_storage/src/isolated/isolated_storage.dart';
import 'package:native_storage/src/native_storage.dart';
import 'package:native_storage/src/secure/secure_storage.dart';

/// An in-memory implementation of [NativeStorage] and [NativeSecureStorage].
final class NativeMemoryStorage implements NativeStorage, NativeSecureStorage {
  NativeMemoryStorage({
    String? namespace,
    this.scope,
  }) : namespace = namespace ?? '';

  @override
  final String namespace;

  @override
  final String? scope;

  final _storage = <String, String>{};
  late final String _prefix =
      scope == null ? '$namespace/' : '$namespace/$scope/';

  @override
  void clear() => _storage.removeWhere((key, _) => key.startsWith(_prefix));

  @override
  String? delete(String key) => _storage.remove('$_prefix$key');

  @override
  String? read(String key) => _storage['$_prefix$key'];

  @override
  String write(String key, String value) => _storage['$_prefix$key'] = value;

  @override
  void close() => clear();

  @override
  NativeSecureStorage get secure => this;

  IsolatedNativeStorage? _isolated;
  @override
  IsolatedNativeStorage get isolated => _isolated ??= IsolatedNativeStorage(
        factory: NativeMemoryStorage.new,
        namespace: namespace,
        scope: scope,
      );

  @override
  NativeMemoryStorage scoped(String scope) => NativeMemoryStorage(
        namespace: namespace,
        scope: switch (this.scope) {
          final currentScope? => '$currentScope/$scope',
          null => scope,
        },
      );
}
