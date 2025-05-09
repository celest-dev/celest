import 'dart:typed_data';

import 'package:celest_core/celest_core.dart';
import 'package:chunked_stream/chunked_stream.dart' show readByteStream;
import 'package:shelf/shelf.dart';

/// {@template celest.runtime.decode_json}
/// Decodes the JSON body of a [Request].
/// {@endtemplate}
extension DecodeJson on Request {
  /// {@macro celest.runtime.decode_json}
  Future<Map<String, Object?>> decodeJson() async {
    try {
      final Uint8List bytes = await readByteStream(read());
      return JsonUtf8.decodeMap(bytes);
    } on FormatException catch (e) {
      throw BadRequestException('Could not parse the JSON body: $e');
    }
  }
}

/// The `Content-Type` header.
const contentTypeHeader = 'Content-Type';

/// The `application/json` content type.
const jsonContentType = 'application/json';
