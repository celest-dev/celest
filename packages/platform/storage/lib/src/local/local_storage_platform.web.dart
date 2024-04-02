import 'package:platform_storage/platform_storage.dart';
import 'package:web/web.dart' as web;

/// The browser implementation of [PlatformLocalStorage].
final class LocalStoragePlatform implements PlatformLocalStorage {
  LocalStoragePlatform({
    required this.namespace,
    this.scope,
  }) : _prefix = scope == null ? '$namespace/' : '$namespace.$scope/';

  @override
  final String namespace;
  @override
  final String? scope;

  final String _prefix;
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
