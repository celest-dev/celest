import 'dart:async';

import 'package:celest_core/src/auth/authenticator.dart';
import 'package:celest_core/src/events/event_channel.dart';
import 'package:celest_core/src/events/sse/sse_client.dart';
import 'package:http/http.dart' as http;
import 'package:stream_channel/stream_channel.dart';

final class EventChannelPlatform
    extends DelegatingStreamChannel<Map<String, Object?>>
    implements EventChannel {
  EventChannelPlatform._(super._inner);

  factory EventChannelPlatform.connect(
    Uri uri, {
    Authenticator? authenticator,
    http.Client? httpClient,
  }) {
    final sseClient = SseClient(serverUri: uri, httpClient: httpClient);
    final completer = StreamChannelCompleter<Map<String, Object?>>();
    sseClient.onConnected
        .then((_) => completer.setChannel(sseClient))
        .onError<Object>((e, st) {
      sseClient.close();
      completer.setError(e, st);
    });
    return EventChannelPlatform._(sseClient);
  }

  @override
  void close() {
    sink.close().ignore();
  }
}
