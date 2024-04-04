import 'package:integration_test/integration_test.dart';
import 'package:native_storage/native_storage.dart';

import 'storage_shared.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  sharedTests('NativeMemoryStorage', NativeMemoryStorage.new);
  sharedTests('NativeSecureStorage', NativeSecureStorage.new);
  sharedTests('NativeLocalStorage', NativeLocalStorage.new);
}