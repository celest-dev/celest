import 'dart:convert';

import 'package:celest_core/celest_core.dart';

mixin BaseProtocol {
  Never httpError({
    required int statusCode,
    required String body,
  }) {
    Map<String, Object?>? jsonBody;
    try {
      jsonBody = jsonDecode(body) as Map<String, dynamic>;
      final error = jsonBody['error'] as Map? ?? jsonBody;
      final code = error['code'];
      final message = error['message'] as String?;
      final details = error['details'] as JsonValue?;
      throw CloudException.http(
        statusCode: statusCode,
        code: code,
        message: message,
        details: details,
      );
    } on Object {
      if (jsonBody == null) {
        throw CloudException.unknownError(
          body,
        );
      }
      throw CloudException.unknownError(
        null,
        details: JsonMap(jsonBody),
      );
    }
  }
}
