import 'package:celest_core/src/storage/local/local_storage.dart';
import 'package:celest_core/src/storage/secure/secure_storage_platform.vm.dart';

extension type LocalStoragePlatform._(LocalStorage _impl)
    implements LocalStorage {
  LocalStoragePlatform({String? scope})
      : _impl = SecureStoragePlatform(scope: scope ?? _defaultScope);

  static const _defaultScope = 'dev.celest.celest';
}
