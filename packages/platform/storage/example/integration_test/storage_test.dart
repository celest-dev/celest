import 'package:integration_test/integration_test.dart';
import 'package:platform_storage/platform_storage.dart';

import 'storage_shared.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  sharedTests('MemoryStorage', PlatformMemoryStorage.new);
  sharedTests('SecureStorage', PlatformSecureStorage.new);
  sharedTests('LocalStorage', PlatformLocalStorage.new);
}
