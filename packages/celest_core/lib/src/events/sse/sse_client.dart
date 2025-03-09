import 'package:celest_core/src/events/sse/sse_client.vm.dart'
    if (dart.library.js_interop) 'package:celest_core/src/events/sse/sse_client.web.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:stream_channel/stream_channel.dart';

/// {@template celest.runtime.sse_client}
/// A Server-Sent Events (SSE) client.
/// {@endtemplate}
abstract class SseClient with StreamChannelMixin<Object?> {
  /// Creates a new [SseClient] connected to the server at [serverUri].
  factory SseClient({
    required Uri serverUri,
    http.Client? httpClient,
    String? clientId,
  }) = SseClientPlatform;

  @protected
  SseClient.base();

  /// The client ID used to identify this client to the server.
  String get clientId;

  /// Completes when the server connection is established.
  Future<void> get onConnected;

  /// Closes the connection to the server.
  void close();
}
