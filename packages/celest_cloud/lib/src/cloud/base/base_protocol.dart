import 'package:celest_core/celest_core.dart';

mixin BaseProtocol {
  Never throwError({
    required int statusCode,
    required List<int> bodyBytes,
  }) {
    final jsonBody = JsonUtf8.decodeMap(bodyBytes);
    throw CloudException.fromJson(jsonBody, code: statusCode);
  }
}
