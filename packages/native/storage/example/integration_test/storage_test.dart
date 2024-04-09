import 'package:integration_test/integration_test.dart';
import 'package:native_storage/native_storage.dart';
import 'package:native_storage/src/local/local_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:native_storage/src/local/local_storage_platform.web.dart';
import 'package:native_storage/src/secure/secure_storage_platform.vm.dart'
    if (dart.library.js_interop) 'package:native_storage/src/secure/secure_storage_platform.web.dart';

import 'storage_shared.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  sharedTests('NativeMemoryStorage', NativeMemoryStorage.new);
  sharedTests('NativeSecureStorage', NativeSecureStoragePlatform.new);
  sharedTests('NativeLocalStorage', NativeLocalStoragePlatform.new);
}
