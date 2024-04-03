import 'package:native_storage/native_storage.dart';
import 'package:web/web.dart' as web;

/// The browser implementation of [NativeLocalStorage].
final class NativeLocalStoragePlatform implements NativeLocalStorage {
  NativeLocalStoragePlatform({String? namespace, this.scope})
      : namespace = namespace ?? web.window.location.hostname;

  @override
  final String namespace;

  @override
  final String? scope;

  late final String _prefix =
      scope == null ? '$namespace/' : '$namespace/$scope/';
  final web.Storage _storage = web.window.localStorage;

  @override
  void clear() {
    for (final key in _storage.keys) {
      if (key.startsWith(_prefix)) {
        _storage.removeItem(key);
      }
    }
  }

  @override
  String? delete(String key) {
    final value = read(key);
    if (value != null) {
      _storage.removeItem('$_prefix$key');
    }
    return null;
  }

  @override
  String? read(String key) => _storage['$_prefix$key'];

  @override
  String write(String key, String value) {
    _storage.setItem('$_prefix$key', value);
    return value;
  }

  @override
  void close() {
    _isolated?.close().ignore();
    _isolated = null;
  }

  @override
  NativeSecureStorage get secure =>
      NativeSecureStorage(namespace: namespace, scope: scope);

  IsolatedNativeStorage? _isolated;
  @override
  IsolatedNativeStorage get isolated => _isolated ??= IsolatedNativeStorage(
        factory: NativeLocalStoragePlatform.new,
        namespace: namespace,
        scope: scope,
      );

  @override
  NativeLocalStorage scoped(String scope) => NativeLocalStoragePlatform(
        namespace: namespace,
        scope: switch (this.scope) {
          final currentScope? => '$currentScope/$scope',
          null => scope,
        },
      );
}

extension on web.Storage {
  List<String> get keys => [for (var i = 0; i < length; i++) key(i)!];
}
