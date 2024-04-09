import 'dart:io';

import 'package:meta/meta.dart';
import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/native_storage_extended.dart';
import 'package:native_storage/src/secure/secure_storage.android.dart';
import 'package:native_storage/src/secure/secure_storage.darwin.dart';
import 'package:native_storage/src/secure/secure_storage.linux.dart';
import 'package:native_storage/src/secure/secure_storage.windows.dart';

abstract base class NativeSecureStoragePlatform
    implements
        NativeSecureStorage,
        // ignore: invalid_use_of_visible_for_testing_member
        NativeStorageExtended {
  factory NativeSecureStoragePlatform({
    String? namespace,
    String? scope,
  }) {
    if (Platform.isIOS || Platform.isMacOS) {
      return SecureStorageDarwin(namespace: namespace, scope: scope);
    }
    if (Platform.isAndroid) {
      return SecureStorageAndroid(namespace: namespace, scope: scope);
    }
    if (Platform.isLinux) {
      return SecureStorageLinux(namespace: namespace, scope: scope);
    }
    if (Platform.isWindows) {
      return SecureStorageWindows(namespace: namespace, scope: scope);
    }
    throw UnsupportedError('This platform is not yet supported.');
  }

  @protected
  NativeSecureStoragePlatform.base({
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
  NativeSecureStorage get secure => this;

  IsolatedNativeStorage? _isolated;
  @override
  IsolatedNativeStorage get isolated => _isolated ??= IsolatedNativeStorage(
        factory: NativeSecureStoragePlatform.new,
        namespace: namespace,
        scope: scope,
      );

  @override
  NativeSecureStorage scoped(String scope) => NativeSecureStoragePlatform(
        namespace: namespace,
        scope: switch (this.scope) {
          final currentScope? => '$currentScope/$scope',
          null => scope,
        },
      );
}
