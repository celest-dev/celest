import 'dart:math';
import 'dart:typed_data';

final _rand = Random();

class Uuid {
  const Uuid(this.value);

  factory Uuid.v7() => Uuid(_uuidv7());

  factory Uuid.parse(String uuid) {
    final buffer = Uint8List(16);
    var i = 0;
    for (var j = 0; j < uuid.length; j += 2) {
      if (uuid[j] == '-') {
        j++;
      }
      buffer[i++] = int.parse(uuid.substring(j, j + 2), radix: 16);
    }
    return Uuid(buffer);
  }

  final Uint8List value;

  static bool _addSeparator(int i) => i == 4 || i == 6 || i == 8 || i == 10;

  String get hexValue {
    final buffer = StringBuffer();
    for (var i = 0; i < value.length; i++) {
      if (_addSeparator(i)) {
        buffer.write('-');
      }
      buffer.write(_byteToHex[value[i]]);
    }
    return buffer.toString();
  }

  @override
  String toString() => hexValue;
}

/// Creates a new v7 UUID.
///
/// Spec: https://datatracker.ietf.org/doc/html/draft-ietf-uuidrev-rfc4122bis#name-uuid-version-7
Uint8List _uuidv7() {
  /*
		 0                   1                   2                   3
		 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
		+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
		|                           unix_ts_ms                          |
     3               4                   5                   6
     2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3
		+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
		|          unix_ts_ms           |  ver  |         rand_a        |
     6
     4 5 6
		+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
		|var|                        rand_b                             |
		+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
		|                            rand_b                             |
		+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
	*/

  final uuid = Uint8List(16);
  final int time = DateTime.now().millisecondsSinceEpoch;

  // The most significant 48 bits of the timestamp.
  uuid[0] = time >> 40 & 0xff;
  uuid[1] = time >> 32 & 0xff;
  uuid[2] = time >> 24 & 0xff;
  uuid[3] = time >> 16 & 0xff;
  uuid[4] = time >> 8 & 0xff;
  uuid[5] = time & 0xff;

  for (var offset = 6; offset < 16; offset++) {
    uuid[offset] = _rand.nextInt(256);
  }

  uuid[6] = (uuid[6] & 0x0f) | 0x70; // version 7
  uuid[7] = (uuid[8] & 0x3f) | 0x80; // variant is 0b10

  return uuid.asUnmodifiableView();
}

// Precomputed padded hex values for each byte (0-255).
const _byteToHex = [
  '00', '01', '02', '03', '04', '05', '06', '07', //
  '08', '09', '0a', '0b', '0c', '0d', '0e', '0f', //
  '10', '11', '12', '13', '14', '15', '16', '17', //
  '18', '19', '1a', '1b', '1c', '1d', '1e', '1f', //
  '20', '21', '22', '23', '24', '25', '26', '27', //
  '28', '29', '2a', '2b', '2c', '2d', '2e', '2f', //
  '30', '31', '32', '33', '34', '35', '36', '37', //
  '38', '39', '3a', '3b', '3c', '3d', '3e', '3f', //
  '40', '41', '42', '43', '44', '45', '46', '47', //
  '48', '49', '4a', '4b', '4c', '4d', '4e', '4f', //
  '50', '51', '52', '53', '54', '55', '56', '57', //
  '58', '59', '5a', '5b', '5c', '5d', '5e', '5f', //
  '60', '61', '62', '63', '64', '65', '66', '67', //
  '68', '69', '6a', '6b', '6c', '6d', '6e', '6f', //
  '70', '71', '72', '73', '74', '75', '76', '77', //
  '78', '79', '7a', '7b', '7c', '7d', '7e', '7f', //
  '80', '81', '82', '83', '84', '85', '86', '87', //
  '88', '89', '8a', '8b', '8c', '8d', '8e', '8f', //
  '90', '91', '92', '93', '94', '95', '96', '97', //
  '98', '99', '9a', '9b', '9c', '9d', '9e', '9f', //
  'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', //
  'a8', 'a9', 'aa', 'ab', 'ac', 'ad', 'ae', 'af', //
  'b0', 'b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', //
  'b8', 'b9', 'ba', 'bb', 'bc', 'bd', 'be', 'bf', //
  'c0', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', //
  'c8', 'c9', 'ca', 'cb', 'cc', 'cd', 'ce', 'cf', //
  'd0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', //
  'd8', 'd9', 'da', 'db', 'dc', 'dd', 'de', 'df', //
  'e0', 'e1', 'e2', 'e3', 'e4', 'e5', 'e6', 'e7', //
  'e8', 'e9', 'ea', 'eb', 'ec', 'ed', 'ee', 'ef', //
  'f0', 'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', //
  'f8', 'f9', 'fa', 'fb', 'fc', 'fd', 'fe', 'ff',
];
