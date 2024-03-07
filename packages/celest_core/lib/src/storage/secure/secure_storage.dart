import 'package:celest_core/src/storage/secure/secure_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/storage/secure/secure_storage_platform.web.dart';
import 'package:celest_core/src/storage/storage.dart';

abstract interface class SecureStorage implements Storage {
  factory SecureStorage({String? scope}) = SecureStoragePlatform;
}
