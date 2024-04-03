import 'package:integration_test/integration_test.dart';
import 'package:native_storage/native_storage.dart';

import 'storage_shared.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  sharedTests('MemoryStorage', NativeMemoryStorage.new);
  sharedTests('SecureStorage', NativeSecureStorage.new);
  sharedTests('LocalStorage', NativeLocalStorage.new);
}
