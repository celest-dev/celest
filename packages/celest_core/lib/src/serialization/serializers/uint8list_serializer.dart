import 'dart:convert';
import 'dart:typed_data';

import 'package:celest_core/src/serialization/serializer.dart';

/// A [Serializer] for [Uint8List] objects.
final class Uint8ListSerializer extends Serializer<Uint8List> {
  /// Creates a [Serializer] for [Uint8List] objects.
  const Uint8ListSerializer();

  @override
  Uint8List deserialize(Object? value) {
    return base64Decode(assertWireType(value));
  }

  @override
  String serialize(Uint8List value) {
    return base64Encode(value);
  }
}
