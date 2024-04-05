import 'dart:io';

import 'package:meta/meta.dart';
import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/local/local_storage.android.dart';
import 'package:native_storage/src/local/local_storage.linux.dart';
import 'package:native_storage/src/local/local_storage.windows.dart';
import 'package:native_storage/src/local/local_storage_darwin.dart';

/// The VM implementation of [NativeLocalStorage].
abstract base class NativeLocalStoragePlatform implements NativeLocalStorage {
  factory NativeLocalStoragePlatform({
    String? namespace,
    String? scope,
  }) {
    if (Platform.isMacOS || Platform.isIOS) {
      return LocalStoragePlatformDarwin(namespace: namespace, scope: scope);
    }
    if (Platform.isAndroid) {
      return LocalStoragePlatformAndroid(namespace: namespace, scope: scope);
    }
    if (Platform.isWindows) {
      return LocalStorageWindows(namespace: namespace, scope: scope);
    }
    if (Platform.isLinux) {
      return LocalStorageLinux(namespace: namespace, scope: scope);
    }
    throw UnsupportedError('This platform is not yet supported.');
  }

  @protected
  NativeLocalStoragePlatform.base({
    this.scope,
  });

  @override
  final String? scope;

  @override
  @mustCallSuper
  void close() {
    _secure?.close();
    _secure = null;
    _isolated?.close().ignore();
    _isolated = null;
  }

  NativeSecureStorage? _secure;
  @override
  NativeSecureStorage get secure =>
      _secure ??= NativeSecureStorage(namespace: namespace, scope: scope);

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
