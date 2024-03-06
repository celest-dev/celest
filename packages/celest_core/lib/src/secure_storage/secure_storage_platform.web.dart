import 'package:celest_core/src/secure_storage/secure_storage.dart';
import 'package:celest_core/src/secure_storage/secure_storage.stub.dart';
import 'package:meta/meta.dart';

abstract base class SecureStoragePlatform implements SecureStorage {
  factory SecureStoragePlatform({
    String? scope,
  }) =>
      SecureStoragePlatformStub(scope: scope ?? _defaultScope);

  static const _defaultScope = 'dev.celest.celest';

  @protected
  const SecureStoragePlatform.base();
}
