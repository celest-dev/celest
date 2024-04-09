import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/local/local_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:native_storage/src/local/local_storage_platform.web.dart';
import 'package:native_storage/src/secure/secure_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:native_storage/src/secure/secure_storage_platform.web.dart';

import '../example/integration_test/storage_shared.dart';

void main() {
  sharedTests('NativeMemoryStorage', NativeMemoryStorage.new);
  sharedTests('NativeSecureStorage', NativeSecureStoragePlatform.new);
  sharedTests('NativeLocalStorage', NativeLocalStoragePlatform.new);
}
