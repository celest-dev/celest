import 'dart:typed_data';

import 'package:celest_core/_internal.dart';

TypeId<T> typeId<T extends Object>([String type = '']) =>
    TypeId<T>._create(type);

typedef TypeIdData = ({
  String type,
  Uuid uuid,
});

extension type TypeId<T extends Object>._(String _encoded) implements String {
  factory TypeId._create(String type) {
    final id = Uuid.v7();
    return TypeId._('${type}_${_encode(id)}');
  }

  String get type => split('_').first;

  TypeIdData get decoded {
    final [type, id] = split('_');
    return (type: type, uuid: _decode(id));
  }
}

final _alphabet = '0123456789abcdefghjkmnpqrstvwxyz'.codeUnits;

/// Encodes a [value] as a base32 string.
String _encode(Uuid uuid) {
  final value = uuid.value;
  if (value.length != 16) {
    throw FormatException(
      'Invalid UUID. Expected 16 bytes, got ${value.length}.',
    );
  }

  final result = Uint8List(26);

  // 10 byte timestamp
  result[0] = _alphabet[(value[0] & 224) >> 5];
  result[1] = _alphabet[value[0] & 31];
  result[2] = _alphabet[(value[1] & 248) >> 3];
  result[3] = _alphabet[((value[1] & 7) << 2) | ((value[2] & 192) >> 6)];
  result[4] = _alphabet[(value[2] & 62) >> 1];
  result[5] = _alphabet[((value[2] & 1) << 4) | ((value[3] & 240) >> 4)];
  result[6] = _alphabet[((value[3] & 15) << 1) | ((value[4] & 128) >> 7)];
  result[7] = _alphabet[(value[4] & 124) >> 2];
  result[8] = _alphabet[((value[4] & 3) << 3) | ((value[5] & 224) >> 5)];
  result[9] = _alphabet[value[5] & 31];

  // 16 bytes of entropy
  result[10] = _alphabet[(value[6] & 248) >> 3];
  result[11] = _alphabet[((value[6] & 7) << 2) | ((value[7] & 192) >> 6)];
  result[12] = _alphabet[(value[7] & 62) >> 1];
  result[13] = _alphabet[((value[7] & 1) << 4) | ((value[8] & 240) >> 4)];
  result[14] = _alphabet[((value[8] & 15) << 1) | ((value[9] & 128) >> 7)];
  result[15] = _alphabet[(value[9] & 124) >> 2];
  result[16] = _alphabet[((value[9] & 3) << 3) | ((value[10] & 224) >> 5)];
  result[17] = _alphabet[value[10] & 31];
  result[18] = _alphabet[(value[11] & 248) >> 3];
  result[19] = _alphabet[((value[11] & 7) << 2) | ((value[12] & 192) >> 6)];
  result[20] = _alphabet[(value[12] & 62) >> 1];
  result[21] = _alphabet[((value[12] & 1) << 4) | ((value[13] & 240) >> 4)];
  result[22] = _alphabet[((value[13] & 15) << 1) | ((value[14] & 128) >> 7)];
  result[23] = _alphabet[(value[14] & 124) >> 2];
  result[24] = _alphabet[((value[14] & 3) << 3) | ((value[15] & 224) >> 5)];
  result[25] = _alphabet[value[15] & 31];

  return String.fromCharCodes(result);
}

const _dec = <int>[
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x01, //
  0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x0A, 0x0B, 0x0C, //
  0x0D, 0x0E, 0x0F, 0x10, 0x11, 0xFF, 0x12, 0x13, 0xFF, 0x14, //
  0x15, 0xFF, 0x16, 0x17, 0x18, 0x19, 0x1A, 0xFF, 0x1B, 0x1C, //
  0x1D, 0x1E, 0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, //
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
];

Uuid _decode(String encoded) {
  final bytes = encoded.codeUnits;
  if (bytes.length != 26) {
    throw FormatException('Invalid base32 length: ${encoded.length}', encoded);
  }

  // Check if all the characters are part of the expected base32 character set
  for (var offset = 0; offset < 26; offset++) {
    final byte = bytes[offset];
    if (_dec[byte] == 0xff) {
      throw FormatException(
        'Invalid base32 character: $byte (offset=$offset)',
        encoded,
      );
    }
  }

  final id = Uint8List(16);

  // 6 bytes timestamp (48 bits)
  id[0] = (_dec[bytes[0]] << 5) | _dec[bytes[1]];
  id[1] = (_dec[bytes[2]] << 3) | (_dec[bytes[3]] >> 2);
  id[2] = (_dec[bytes[3]] << 6) | (_dec[bytes[4]] << 1) | (_dec[bytes[5]] >> 4);
  id[3] = (_dec[bytes[5]] << 4) | (_dec[bytes[6]] >> 1);
  id[4] = (_dec[bytes[6]] << 7) | (_dec[bytes[7]] << 2) | (_dec[bytes[8]] >> 3);
  id[5] = (_dec[bytes[8]] << 5) | _dec[bytes[9]];

  // 10 bytes of entropy (80 bits)
  id[6] = (_dec[bytes[10]] << 3) |
      (_dec[bytes[11]] >> 2); // First 4 bits are the version
  id[7] =
      (_dec[bytes[11]] << 6) | (_dec[bytes[12]] << 1) | (_dec[bytes[13]] >> 4);
  id[8] = (_dec[bytes[13]] << 4) |
      (_dec[bytes[14]] >> 1); // First 2 bits are the variant
  id[9] =
      (_dec[bytes[14]] << 7) | (_dec[bytes[15]] << 2) | (_dec[bytes[16]] >> 3);
  id[10] = (_dec[bytes[16]] << 5) | _dec[bytes[17]];
  id[11] = (_dec[bytes[18]] << 3) | _dec[bytes[19]] >> 2;
  id[12] =
      (_dec[bytes[19]] << 6) | (_dec[bytes[20]] << 1) | (_dec[bytes[21]] >> 4);
  id[13] = (_dec[bytes[21]] << 4) | (_dec[bytes[22]] >> 1);
  id[14] =
      (_dec[bytes[22]] << 7) | (_dec[bytes[23]] << 2) | (_dec[bytes[24]] >> 3);
  id[15] = (_dec[bytes[24]] << 5) | _dec[bytes[25]];

  return Uuid(id);
}
