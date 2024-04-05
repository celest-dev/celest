import 'package:native_storage/native_storage.dart';

import '../example/integration_test/storage_shared.dart';

void main() {
  sharedTests('NativeMemoryStorage', NativeMemoryStorage.new);
  sharedTests('NativeSecureStorage', NativeSecureStorage.new);
  sharedTests('NativeLocalStorage', NativeLocalStorage.new);
}
