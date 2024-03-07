import 'package:celest_core/src/storage/local/local_storage.dart';
import 'package:web/web.dart' as web;

final class LocalStoragePlatform implements LocalStorage {
  LocalStoragePlatform({String? scope}) : scope = scope ?? _defaultScope;

  static const _defaultScope = 'dev.celest.celest';

  final String scope;
  final web.Storage _storage = web.window.localStorage;

  @override
  void clear() {
    for (final key in _storage.keys) {
      if (key.startsWith('$scope/')) {
        _storage.removeItem(key);
      }
    }
  }

  @override
  String? delete(String key) {
    final value = read(key);
    if (value != null) {
      _storage.removeItem('$scope/$key');
    }
    return null;
  }

  @override
  String? read(String key) => _storage['$scope/$key'];

  @override
  String write(String key, String value) {
    _storage.setItem('$scope/$key', value);
    return value;
  }
}

extension on web.Storage {
  List<String> get keys => [for (var i = 0; i < length; i++) key(i)!];
}
