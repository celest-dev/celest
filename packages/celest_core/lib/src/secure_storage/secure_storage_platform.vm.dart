import 'dart:io';

import 'package:celest_core/src/secure_storage/secure_storage.android.dart';
import 'package:celest_core/src/secure_storage/secure_storage.dart';
import 'package:celest_core/src/secure_storage/secure_storage.darwin.dart';
import 'package:meta/meta.dart';

abstract base class SecureStoragePlatform implements SecureStorage {
  factory SecureStoragePlatform({
    String? scope,
  }) {
    if (Platform.isIOS || Platform.isMacOS) {
      return SecureStoragePlatformDarwin(scope: scope ?? _defaultScope);
    }
    if (Platform.isAndroid) {
      return SecureStoragePlatformAndroid(scope: scope ?? _defaultScope);
    }
    throw UnsupportedError('This platform is not yet supported.');
  }

  static const _defaultScope = 'dev.celest.celest';

  @override
  void init() {}

  @protected
  const SecureStoragePlatform.base();
}
