import 'package:platform_storage/platform_storage.dart';

import '../example/integration_test/storage_shared.dart';

void main() {
  sharedTests('PlatformMemoryStorage', PlatformMemoryStorage.new);
  sharedTests('PlatformSecureStorage', PlatformSecureStorage.new);
  sharedTests('PlatformLocalStorage', PlatformLocalStorage.new);
}
