import 'dart:io';

import 'package:meta/meta.dart';
import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/local/local_storage.android.dart';
import 'package:platform_storage/src/local/local_storage_darwin.dart';

/// The VM implementation of [PlatformLocalStorage].
abstract base class LocalStoragePlatform implements PlatformLocalStorage {
  factory LocalStoragePlatform({
    required String namespace,
    String? scope,
  }) {
    if (Platform.isMacOS || Platform.isIOS) {
      return LocalStoragePlatformDarwin(namespace: namespace, scope: scope);
    }
    if (Platform.isAndroid) {
      return LocalStoragePlatformAndroid(namespace: namespace, scope: scope);
    }
    throw UnsupportedError('This platform is not yet supported.');
  }

  @protected
  LocalStoragePlatform.base({
    required this.namespace,
    this.scope,
  });

  @override
  final String namespace;

  @override
  final String? scope;

  @override
  @mustCallSuper
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
