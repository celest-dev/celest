import 'dart:convert';
import 'dart:typed_data';

import 'package:celest_core/src/exception/cloud_exception.dart';

/// Conversion between JSON and UTF-8.
extension JsonUtf8 on Object {
  /// A JSON encoder that encodes to UTF-8.
  static final encoder = JsonUtf8Encoder();

  /// A JSON decoder that decodes from UTF-8.
  static final decoder =
      utf8.decoder.fuse(json.decoder).cast<Uint8List, Object?>();

  /// Encodes a JSON [object] to a UTF-8 buffer.
  static Uint8List encode(Object? object) {
    return encoder.convert(object) as Uint8List;
  }

  /// Decodes a UTF-8 buffer to a JSON object.
  static Object? decode(List<int> bytes) {
    return decoder.convert(bytes as Uint8List);
  }

  /// Decodes a [Stream] of UTF-8 bytes to a JSON object.
  static Future<Object?> decodeStream(Stream<List<int>> stream) async {
    return stream.transform(decoder).first;
  }

  static Never _invalidJson(Object? json) {
    throw BadRequestException('Invalid JSON body (${json.runtimeType}): $json');
  }

  /// Decodes a JSON map [body] from a `List<int>` or [String].
  static Object? decodeAny(Object? body) {
    return switch (body) {
      List<int>() => body.isEmpty ? const {} : decode(body),
      String() =>
        body.isEmpty
            ? const {}
            : () {
              try {
                return jsonDecode(body);
              } on Object {
                return body;
              }
            }(),
      _ => body,
    };
  }

  /// Decodes a JSON map [body] from a `List<int>` or [String].
  static Map<String, Object?> decodeMap(Object? body) {
    Object? decoded;
    switch (body) {
      case List<int>():
        if (body.isEmpty) return const {};
        decoded = decode(body);
      case String():
        if (body.isEmpty) return const {};
        try {
          decoded = jsonDecode(body);
        } on Object {
          decoded = body;
        }
      default:
        decoded = body;
    }
    return switch (decoded) {
      null => const <String, Object?>{},
      Map<String, Object?>() => decoded,
      Map() => decoded.cast(),
      _ => _invalidJson(decoded),
    };
  }
}
