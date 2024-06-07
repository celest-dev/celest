import 'package:celest_core/src/events/sse/sse_client.dart';
import 'package:http/http.dart' as http;

abstract class SseClientPlatform extends SseClient {
  factory SseClientPlatform({
    required Uri serverUri,
    http.Client? httpClient,
    String? clientId,
  }) {
    throw UnsupportedError('SSE is not supported on this platform');
  }
}
