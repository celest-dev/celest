import 'package:native_storage/native_storage.dart';

import '../example/integration_test/storage_shared.dart';

void main() {
  sharedTests('PlatformMemoryStorage', NativeMemoryStorage.new);
  sharedTests('PlatformSecureStorage', NativeSecureStorage.new);
  sharedTests('PlatformLocalStorage', NativeLocalStorage.new);
}
