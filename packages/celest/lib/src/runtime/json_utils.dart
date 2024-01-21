import 'dart:convert';

import 'package:celest_core/celest_core.dart';
import 'package:chunked_stream/chunked_stream.dart' show readByteStream;
import 'package:shelf/shelf.dart';

/// {@template celest.runtime.decode_json}
/// Decodes the JSON body of a [Request].
/// {@endtemplate}
extension DecodeJson on Request {
  static final _decoder = utf8.decoder.fuse(json.decoder);

  /// {@macro celest.runtime.decode_json}
  Future<Map<String, Object?>> decodeJson() async {
    try {
      final bytes = await readByteStream(read());
      if (bytes.isEmpty) {
        return const {};
      }
      final jsonObject = _decoder.convert(bytes);
      return switch (jsonObject) {
        null => const <String, Object?>{},
        Map<String, Object?>() => jsonObject,
        Map() => jsonObject.cast(),
        _ => throw BadRequestException('Invalid JSON body: $jsonObject'),
      };
    } on FormatException catch (e) {
      throw BadRequestException('Could not parse the JSON body: $e');
    }
  }
}

/// The `Content-Type` header.
const contentTypeHeader = 'Content-Type';

/// The `application/json` content type.
const jsonContentType = 'application/json';
