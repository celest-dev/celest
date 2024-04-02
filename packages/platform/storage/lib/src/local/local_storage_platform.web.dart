import 'package:platform_storage/platform_storage.dart';
import 'package:web/web.dart' as web;

/// The browser implementation of [PlatformLocalStorage].
final class LocalStoragePlatform implements PlatformLocalStorage {
  LocalStoragePlatform({String? namespace, this.scope})
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
  PlatformSecureStorage get secure =>
      PlatformSecureStorage(namespace: namespace, scope: scope);

  IsolatedPlatformStorage? _isolated;
  @override
  IsolatedPlatformStorage get isolated => _isolated ??= IsolatedPlatformStorage(
        factory: LocalStoragePlatform.new,
        namespace: namespace,
        scope: scope,
      );

  @override
  PlatformLocalStorage scoped(String scope) => LocalStoragePlatform(
        namespace: namespace,
        scope: switch (this.scope) {
          final currentScope? => '$currentScope.$scope',
          null => scope,
        },
      );
}

extension on web.Storage {
  List<String> get keys => [for (var i = 0; i < length; i++) key(i)!];
}
