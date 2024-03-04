import 'package:celest_auth/src/storage/secure_storage.android.dart';
import 'package:celest_auth/src/storage/secure_storage.darwin.dart';
import 'package:celest_auth/src/storage/secure_storage.stub.dart';
// ignore: implementation_imports
import 'package:celest_core/src/util/globals.dart';
import 'package:meta/meta.dart';
import 'package:os_detect/os_detect.dart' as os;

abstract interface class SecureStorage {
  factory SecureStorage() = SecureStoragePlatform;
  const SecureStorage._();

  void init() {}
  String? read(String key);
  Map<String, String> readAll();
  String write(String key, String value);
  String? delete(String key);
  void clear();
}

abstract base class SecureStoragePlatform extends SecureStorage {
  factory SecureStoragePlatform() {
    if (kIsWeb) {
      return SecureStoragePlatformStub();
    }
    if (os.isIOS || os.isMacOS) {
      return SecureStoragePlatformDarwin();
    }
    if (os.isAndroid) {
      return SecureStoragePlatformAndroid();
    }
    throw UnimplementedError();
  }

  @protected
  const SecureStoragePlatform.base() : super._();
}
