import 'package:celest_core/src/storage/local/local_storage.dart';
import 'package:celest_core/src/storage/secure/secure_storage.dart';

import '../../example/integration_test/storage_shared.dart';

void main() {
  sharedTests('SecureStorage', SecureStorage.new);
  sharedTests('LocalStorage', LocalStorage.new);
}
