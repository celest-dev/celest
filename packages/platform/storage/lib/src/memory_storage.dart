import 'package:platform_storage/src/isolated/isolated_storage.dart';
import 'package:platform_storage/src/platform_storage.dart';
import 'package:platform_storage/src/secure/secure_storage.dart';

/// An in-memory implementation of [PlatformStorage] and [PlatformSecureStorage].
final class PlatformMemoryStorage
    implements PlatformStorage, PlatformSecureStorage {
  PlatformMemoryStorage({
    required this.namespace,
    this.scope,
  }) : _prefix = scope == null ? '$namespace/' : '$namespace/$scope/' {
    if (namespace.contains('/')) {
      throw ArgumentError.value(
        namespace,
        'namespace',
        'must not contain a path separator character (`/`)',
      );
    }
    if (scope != null && scope!.contains('/')) {
      throw ArgumentError.value(
        scope,
        'scope',
        'must not contain a path separator character (`/`)',
      );
    }
  }

  @override
  final String namespace;

  @override
  final String? scope;

  final _storage = <String, String>{};
  final String _prefix;

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

  IsolatedPlatformStorage? _isolated;
  @override
  IsolatedPlatformStorage get isolated => _isolated ??= IsolatedPlatformStorage(
        factory: PlatformMemoryStorage.new,
        namespace: namespace,
        scope: scope,
      );

  @override
  PlatformMemoryStorage scoped(String scope) => PlatformMemoryStorage(
        namespace: namespace,
        scope: switch (this.scope) {
          final currentScope? => '$currentScope.$scope',
          null => scope,
        },
      );
}
