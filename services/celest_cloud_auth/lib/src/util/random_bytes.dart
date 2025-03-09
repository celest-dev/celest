import 'dart:math';
import 'dart:typed_data';

final _random = Random.secure();

/// Fills a [Uint8List] with secure random data of [length] bytes.
Uint8List secureRandomBytes(int length) {
  final bytes = Uint8List(length);
  for (var i = 0; i < bytes.length; i++) {
    bytes[i] = _random.nextInt(256);
  }
  return bytes;
}
