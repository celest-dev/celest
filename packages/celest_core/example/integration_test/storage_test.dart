import 'package:celest_core/src/storage/local/local_storage.dart';
import 'package:celest_core/src/storage/secure/secure_storage.dart';
import 'package:integration_test/integration_test.dart';

import 'storage_shared.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  sharedTests('SecureStorage', SecureStorage.new);
  sharedTests('LocalStorage', LocalStorage.new);
}
