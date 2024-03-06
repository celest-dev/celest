import 'package:celest_core/src/secure_storage/secure_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/secure_storage/secure_storage_platform.web.dart';

abstract interface class SecureStorage {
  factory SecureStorage({String? scope}) = SecureStoragePlatform;

  String? read(String key);
  String write(String key, String value);
  String? delete(String key);
  void clear();
}
