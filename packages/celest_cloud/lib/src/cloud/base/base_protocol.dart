import 'dart:convert';

import 'package:celest_core/celest_core.dart';

mixin BaseProtocol {
  Never throwError({
    required int statusCode,
    required List<int> bodyBytes,
  }) {
    try {
      final jsonBody = JsonUtf8.decodeMap(bodyBytes);
      throw CloudException.fromJson(jsonBody, code: statusCode);
    } on FormatException {
      throw CloudException.http(
        code: statusCode,
        message: utf8.decode(bodyBytes),
      );
    }
  }
}
