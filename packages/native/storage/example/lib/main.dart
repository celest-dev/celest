import 'package:native_storage/native_storage.dart';

Future<void> main() async {
  // Native storage is a simple key-value store that can be used to store
  // data on the device. It has three variations: local, secure, and isolated.
  final storage = NativeStorage();
  storage.write('key', 'value');
  print('Value from local storage: ${storage.read('key')}');

  // To create a secure variation of `storage`, use the `secure` getter.
  final secureStorage = storage.secure;

  // Reading the same key should print `null` since secure values are stored
  // separate from the local storage.
  print('Value from secure storage: ${secureStorage.read('key')}');

  secureStorage.write('key', 'value1');
  print('Value from secure storage: ${secureStorage.read('key')}');

  // Typically, though, you should use the `isolated` variation of both
  // local and secure storage so that you never block the UI thread when
  // reading or writing to storage.
  final isolatedStorage = storage.isolated;
  final isolatedRead = await isolatedStorage.read('key');
  print('Value from isolated local storage: $isolatedRead');

  final isolatedSecureStorage = secureStorage.isolated;
  final isolatedSecureRead = await isolatedSecureStorage.read('key');
  print('Value from isolated secure storage: $isolatedSecureRead');
}
