import 'dart:io';

import 'package:meta/meta.dart';
import 'package:platform_storage/platform_storage.dart';
import 'package:platform_storage/src/secure/secure_storage.android.dart';
import 'package:platform_storage/src/secure/secure_storage.darwin.dart';
import 'package:platform_storage/src/secure/secure_storage.linux.dart';
import 'package:platform_storage/src/secure/secure_storage.windows.dart';

abstract base class SecureStoragePlatform implements PlatformSecureStorage {
  factory SecureStoragePlatform({
    String? namespace,
    String? scope,
  }) {
    if (Platform.isIOS || Platform.isMacOS) {
      return SecureStoragePlatformDarwin(namespace: namespace, scope: scope);
    }
    if (Platform.isAndroid) {
      return SecureStoragePlatformAndroid(namespace: namespace, scope: scope);
    }
    if (Platform.isLinux) {
      return SecureStoragePlatformLinux(namespace: namespace, scope: scope);
    }
    if (Platform.isWindows) {
      return SecureStoragePlatformWindows(namespace: namespace, scope: scope);
    }
    throw UnsupportedError('This platform is not yet supported.');
  }

  @protected
  SecureStoragePlatform.base({
    this.scope,
  });

  @override
  final String? scope;

  @override
  @mustCallSuper
  void close() {
    _isolated?.close().ignore();
    _isolated = null;
  }

  @override
  PlatformSecureStorage get secure => this;

  IsolatedPlatformStorage? _isolated;
  @override
  IsolatedPlatformStorage get isolated => _isolated ??= IsolatedPlatformStorage(
        factory: SecureStoragePlatform.new,
        namespace: namespace,
        scope: scope,
      );

  @override
  PlatformSecureStorage scoped(String scope) => SecureStoragePlatform(
        namespace: namespace,
        scope: switch (this.scope) {
          final currentScope? => '$currentScope/$scope',
          null => scope,
        },
      );
}
